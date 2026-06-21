suppressPackageStartupMessages({
  library(data.table)
  library(Matrix)
})

message("[pseudobulk] Building GSE214607 sample-level pseudobulk profiles")

counts_file <- "data/processed/GSE214607/GSE214607_combined_counts_sparse.rds"
cell_meta_file <- "results/qc/GSE214607_cell_metadata_qc_augmented.tsv"
gene_meta_file <- "results/qc/GSE214607_gene_metadata.tsv"

out_dir <- "results/pseudobulk"
qc_dir <- "results/qc"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(qc_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(counts_file)) stop("[pseudobulk] Missing counts file: ", counts_file)
if (!file.exists(cell_meta_file)) stop("[pseudobulk] Missing cell metadata: ", cell_meta_file)
if (!file.exists(gene_meta_file)) stop("[pseudobulk] Missing gene metadata: ", gene_meta_file)

counts <- readRDS(counts_file)
cell_meta <- fread(cell_meta_file)
gene_meta <- fread(gene_meta_file)

if (!identical(colnames(counts), cell_meta$cell_id)) {
  stop("[pseudobulk] Cell order mismatch between count matrix and metadata.")
}

cell_meta[, qc_keep := qc_pass_500_features == TRUE]

kept_cells <- cell_meta[qc_keep == TRUE, cell_id]
message("[pseudobulk] Keeping cells with >=500 features: ", length(kept_cells), " / ", ncol(counts))

counts_keep <- counts[, kept_cells, drop = FALSE]
meta_keep <- cell_meta[match(kept_cells, cell_id)]

sample_ids <- unique(meta_keep$sample_prefix)

pb_mat <- Matrix::Matrix(
  0,
  nrow = nrow(counts_keep),
  ncol = length(sample_ids),
  sparse = TRUE
)

rownames(pb_mat) <- rownames(counts_keep)
colnames(pb_mat) <- sample_ids

pb_meta <- unique(meta_keep[, .(
  dataset_id,
  geo_sample,
  sample_prefix,
  diagnosis,
  tissue_source,
  donor_or_gestation_code,
  replicate
)])

for (sid in sample_ids) {
  idx <- which(meta_keep$sample_prefix == sid)
  pb_mat[, sid] <- Matrix::rowSums(counts_keep[, idx, drop = FALSE])
}

pb_qc <- data.table(
  sample_prefix = colnames(pb_mat),
  pseudobulk_total_counts = as.numeric(Matrix::colSums(pb_mat)),
  pseudobulk_detected_genes = as.numeric(Matrix::colSums(pb_mat > 0)),
  n_cells_used = as.integer(table(factor(meta_keep$sample_prefix, levels = colnames(pb_mat))))
)

pb_qc <- merge(pb_meta, pb_qc, by = "sample_prefix", all.x = TRUE)

# Simple library-size log2 CPM without edgeR/TMM.
lib_size <- Matrix::colSums(pb_mat)
cpm_mat <- t(t(pb_mat) / lib_size * 1e6)
logcpm <- log2(as.matrix(cpm_mat) + 1)

gene_dt <- gene_meta[, .(gene_id, gene_symbol)]
gene_dt <- gene_dt[match(rownames(logcpm), gene_id)]

logcpm_dt <- data.table(
  gene_id = rownames(logcpm),
  gene_symbol = gene_dt$gene_symbol,
  logcpm,
  check.names = FALSE
)

counts_dt <- data.table(
  gene_id = rownames(pb_mat),
  gene_symbol = gene_dt$gene_symbol,
  as.matrix(pb_mat),
  check.names = FALSE
)

saveRDS(pb_mat, file.path(out_dir, "GSE214607_pseudobulk_counts_sparse.rds"))
saveRDS(logcpm, file.path(out_dir, "GSE214607_pseudobulk_log2CPM_matrix.rds"))

fwrite(pb_qc, file.path(qc_dir, "GSE214607_pseudobulk_qc.tsv"), sep = "\t")
fwrite(logcpm_dt, file.path(out_dir, "GSE214607_pseudobulk_log2CPM.tsv"), sep = "\t")
fwrite(counts_dt, file.path(out_dir, "GSE214607_pseudobulk_counts.tsv"), sep = "\t")

message("[pseudobulk] Wrote pseudobulk counts/log2CPM and QC.")
print(pb_qc)
