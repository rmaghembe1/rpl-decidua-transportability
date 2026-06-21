suppressPackageStartupMessages({
  library(data.table)
  library(Matrix)
})

message("[import] Starting real GSE214607 MTX import")

inv_file <- "results/qc/GSE214607_processed_matrix_inventory.tsv"
out_dir <- "data/processed/GSE214607"
qc_dir <- "results/qc"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(qc_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(inv_file)) {
  stop("[import] Missing inventory file: ", inv_file)
}

inv <- fread(inv_file)

required_cols <- c(
  "dataset_id", "geo_sample", "sample_prefix", "diagnosis",
  "tissue_source", "matrix_file", "barcode_file", "genes_file"
)

missing_cols <- setdiff(required_cols, names(inv))
if (length(missing_cols) > 0) {
  stop("[import] Inventory missing required columns: ", paste(missing_cols, collapse = ", "))
}

inv <- inv[
  file.exists(matrix_file) &
    file.exists(barcode_file) &
    file.exists(genes_file)
]

if (nrow(inv) == 0) {
  stop("[import] No complete MTX triplets found.")
}

sample_qc_list <- list()
cell_meta_list <- list()
matrix_list <- list()
gene_ref <- NULL

read_gene_file <- function(path) {
  g <- fread(path, header = FALSE)
  if (ncol(g) < 2) {
    stop("[import] Gene file has fewer than two columns: ", path)
  }
  setnames(g, c("gene_id", "gene_symbol")[seq_len(2)])
  g[, gene_index := .I]
  g
}

for (i in seq_len(nrow(inv))) {
  row <- inv[i]
  message("[import] Reading ", row$sample_prefix)

  genes <- read_gene_file(row$genes_file)
  barcodes <- fread(row$barcode_file, header = FALSE)
  setnames(barcodes, "barcode")

  mat <- Matrix::readMM(gzfile(row$matrix_file))
  mat <- as(mat, "dgCMatrix")

  if (nrow(mat) != nrow(genes)) {
    stop("[import] Gene count mismatch for ", row$sample_prefix)
  }
  if (ncol(mat) != nrow(barcodes)) {
    stop("[import] Barcode count mismatch for ", row$sample_prefix)
  }

  # Use Ensembl IDs as stable rownames; keep symbols in gene metadata.
  rownames(mat) <- genes$gene_id
  colnames(mat) <- paste(row$sample_prefix, barcodes$barcode, sep = "__")

  if (is.null(gene_ref)) {
    gene_ref <- genes[, .(gene_index, gene_id, gene_symbol)]
  } else {
    if (!identical(gene_ref$gene_id, genes$gene_id)) {
      stop("[import] Gene order differs in sample: ", row$sample_prefix)
    }
  }

  n_counts <- Matrix::colSums(mat)
  n_features <- Matrix::colSums(mat > 0)

  cell_meta <- data.table(
    cell_id = colnames(mat),
    barcode = barcodes$barcode,
    dataset_id = row$dataset_id,
    geo_sample = row$geo_sample,
    sample_prefix = row$sample_prefix,
    diagnosis = row$diagnosis,
    tissue_source = row$tissue_source,
    donor_or_gestation_code = if ("donor_or_gestation_code" %in% names(row)) row$donor_or_gestation_code else NA_character_,
    replicate = if ("replicate" %in% names(row)) row$replicate else NA_character_,
    n_counts = as.numeric(n_counts),
    n_features = as.numeric(n_features)
  )

  sample_qc <- data.table(
    dataset_id = row$dataset_id,
    geo_sample = row$geo_sample,
    sample_prefix = row$sample_prefix,
    diagnosis = row$diagnosis,
    tissue_source = row$tissue_source,
    n_genes = nrow(mat),
    n_cells = ncol(mat),
    total_counts = sum(mat@x),
    median_counts_per_cell = median(n_counts),
    median_features_per_cell = median(n_features),
    pct_cells_lt_200_features = mean(n_features < 200) * 100,
    pct_cells_lt_500_features = mean(n_features < 500) * 100
  )

  sample_qc_list[[row$sample_prefix]] <- sample_qc
  cell_meta_list[[row$sample_prefix]] <- cell_meta
  matrix_list[[row$sample_prefix]] <- mat

  saveRDS(
    list(
      counts = mat,
      cell_metadata = cell_meta,
      gene_metadata = genes,
      sample_metadata = as.data.table(row)
    ),
    file.path(out_dir, paste0(row$sample_prefix, "_single_sample_sparse.rds"))
  )
}

message("[import] Combining matrices")
combined_counts <- do.call(cbind, matrix_list)
combined_cell_meta <- rbindlist(cell_meta_list, use.names = TRUE, fill = TRUE)
sample_qc <- rbindlist(sample_qc_list, use.names = TRUE, fill = TRUE)

saveRDS(combined_counts, file.path(out_dir, "GSE214607_combined_counts_sparse.rds"))
saveRDS(combined_cell_meta, file.path(out_dir, "GSE214607_combined_cell_metadata.rds"))
saveRDS(gene_ref, file.path(out_dir, "GSE214607_gene_metadata.rds"))

fwrite(sample_qc, file.path(qc_dir, "GSE214607_sample_level_sc_qc.tsv"), sep = "\t")
fwrite(combined_cell_meta, file.path(qc_dir, "GSE214607_cell_metadata.tsv"), sep = "\t")
fwrite(gene_ref, file.path(qc_dir, "GSE214607_gene_metadata.tsv"), sep = "\t")

summary <- data.table(
  dataset_id = "GSE214607",
  n_samples = nrow(inv),
  n_genes = nrow(combined_counts),
  n_cells = ncol(combined_counts),
  total_counts = sum(combined_counts@x),
  n_control_decidua = nrow(inv[diagnosis == "Control" & tissue_source == "Decidua"]),
  n_control_villi = nrow(inv[diagnosis == "Control" & tissue_source == "Villi"]),
  n_rm_decidua = nrow(inv[diagnosis == "RM" & tissue_source == "Decidua"]),
  n_rm_villi = nrow(inv[diagnosis == "RM" & tissue_source == "Villi"])
)

fwrite(summary, file.path(qc_dir, "GSE214607_import_summary.tsv"), sep = "\t")

message("[import] Complete.")
print(summary)
