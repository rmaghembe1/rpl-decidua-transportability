suppressPackageStartupMessages({
  library(data.table)
})

message("[GSE178535] Importing processed normalised log2 matrix")

infile <- "data/raw/second_bulk_candidates/GSE178535/GSE178535_count.filter0.nor.log2.csv.gz"
out_dir <- "data/processed/second_bulk_candidates/GSE178535"
qc_dir <- "results/qc/second_bulk_candidates"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(qc_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(infile)) stop("[GSE178535] Missing file: ", infile)

dt <- fread(infile)

message("[GSE178535] Raw matrix dimensions: ", nrow(dt), " rows x ", ncol(dt), " columns")
message("[GSE178535] Column names:")
print(names(dt))

# Identify likely gene column.
candidate_gene_cols <- names(dt)[
  grepl("gene|symbol|Gene|Symbol|id|ID", names(dt))
]

if (length(candidate_gene_cols) > 0) {
  gene_col <- candidate_gene_cols[1]
} else {
  gene_col <- names(dt)[1]
}

message("[GSE178535] Using gene column: ", gene_col)

setnames(dt, gene_col, "gene_symbol")

# Detect numeric expression columns.
candidate_cols <- setdiff(names(dt), "gene_symbol")

numeric_flags <- vapply(candidate_cols, function(cc) {
  vals <- suppressWarnings(as.numeric(dt[[cc]]))
  mean(!is.na(vals)) > 0.80
}, logical(1))

sample_cols <- candidate_cols[numeric_flags]
annotation_cols <- setdiff(candidate_cols, sample_cols)

if (length(sample_cols) == 0) {
  stop("[GSE178535] No numeric sample columns detected. Inspect the matrix header manually.")
}

message("[GSE178535] Numeric sample columns:")
print(sample_cols)

if (length(annotation_cols) > 0) {
  message("[GSE178535] Annotation columns retained separately:")
  print(annotation_cols)
}

for (cc in sample_cols) {
  dt[, (cc) := as.numeric(get(cc))]
}

annot <- unique(dt[, c("gene_symbol", annotation_cols), with = FALSE])
expr_log2 <- dt[, c("gene_symbol", sample_cols), with = FALSE]

if (anyDuplicated(expr_log2$gene_symbol) > 0) {
  message("[GSE178535] Collapsing duplicated gene symbols by mean")
  expr_log2 <- expr_log2[, lapply(.SD, mean, na.rm = TRUE), by = gene_symbol]
}

sample_metadata <- data.table(
  sample_id = sample_cols,
  dataset_id = "GSE178535"
)

sample_metadata[, diagnosis := fifelse(
  grepl("RSA|RPL|RM|case|patient", sample_id, ignore.case = TRUE),
  "RSA",
  fifelse(
    grepl("HC|control|normal|Ctrl|CTL", sample_id, ignore.case = TRUE),
    "Control",
    NA_character_
  )
)]

sample_metadata[, tissue_source := "Decidua"]
sample_metadata[, assay_type := "bulk_RNAseq"]
sample_metadata[, expression_sample_id := sample_id]
sample_metadata[, metadata_grade := fifelse(is.na(diagnosis), "C_pending_manual_group_check", "B")]
sample_metadata[, inclusion_role := "third_bulk_transportability_candidate"]
sample_metadata[, notes := "Processed GEO matrix GSE178535_count.filter0.nor.log2.csv.gz; sample diagnosis inferred from column names where possible"]

qc <- data.table(
  dataset_id = "GSE178535",
  n_genes = nrow(expr_log2),
  n_samples = length(sample_cols),
  sample_columns = paste(sample_cols, collapse = ","),
  annotation_columns = paste(annotation_cols, collapse = ","),
  normalization = "GEO processed count.filter0.nor.log2 matrix; no additional log2 transform applied",
  source_file = infile,
  n_control = sum(sample_metadata$diagnosis == "Control", na.rm = TRUE),
  n_case = sum(sample_metadata$diagnosis == "RSA", na.rm = TRUE),
  n_unassigned = sum(is.na(sample_metadata$diagnosis))
)

fwrite(annot, file.path(qc_dir, "GSE178535_gene_annotation.tsv"), sep = "\t")
fwrite(expr_log2, file.path(qc_dir, "GSE178535_normalized_expression_log2.tsv"), sep = "\t")
fwrite(sample_metadata, file.path(qc_dir, "GSE178535_sample_metadata_curated.tsv"), sep = "\t")
fwrite(qc, file.path(qc_dir, "GSE178535_expression_qc.tsv"), sep = "\t")

saveRDS(expr_log2, file.path(out_dir, "GSE178535_normalized_expression_log2.rds"))

message("[GSE178535] Wrote normalized expression, sample metadata and QC files.")
print(qc)
print(sample_metadata)

if (any(is.na(sample_metadata$diagnosis))) {
  stop("[GSE178535] Some samples have unassigned diagnosis. Inspect GSE178535_sample_metadata_curated.tsv before projection.")
}
