suppressPackageStartupMessages({
  library(data.table)
})

message("[GSE113790] Importing processed FPKM matrix")

infile <- "data/raw/second_bulk_candidates/GSE113790/GSE113790_All_Sample_FPKM_Matrix.txt.gz"
out_dir <- "data/processed/second_bulk_candidates/GSE113790"
qc_dir <- "results/qc/second_bulk_candidates"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(qc_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(infile)) stop("[GSE113790] Missing file: ", infile)

dt <- fread(infile)

message("[GSE113790] Matrix dimensions: ", nrow(dt), " rows x ", ncol(dt), " columns")
message("[GSE113790] Column names:")
print(names(dt))

setnames(dt, "GeneName", "gene_symbol")

annotation_cols <- intersect(c("gene_symbol", "locus"), names(dt))
sample_cols <- setdiff(names(dt), annotation_cols)

for (cc in sample_cols) {
  dt[, (cc) := as.numeric(get(cc))]
}

# Preserve annotation separately.
annot <- unique(dt[, ..annotation_cols])

expr <- dt[, c("gene_symbol", sample_cols), with = FALSE]

if (anyDuplicated(expr$gene_symbol) > 0) {
  message("[GSE113790] Collapsing duplicated gene symbols by mean")
  expr <- expr[, lapply(.SD, mean, na.rm = TRUE), by = gene_symbol]
}

expr_log2 <- copy(expr)
for (cc in setdiff(names(expr_log2), "gene_symbol")) {
  expr_log2[, (cc) := log2(get(cc) + 1)]
}

sample_metadata <- data.table(
  sample_id = sample_cols,
  dataset_id = "GSE113790"
)

sample_metadata[, diagnosis := fifelse(
  grepl("induced abortion", sample_id, ignore.case = TRUE),
  "Control",
  fifelse(
    grepl("recurrent spontaneous abortion", sample_id, ignore.case = TRUE),
    "RSA",
    NA_character_
  )
)]

sample_metadata[, tissue_source := "Decidua"]
sample_metadata[, assay_type := "bulk_RNAseq"]
sample_metadata[, expression_sample_id := sample_id]
sample_metadata[, metadata_grade := "B"]
sample_metadata[, inclusion_role := "second_bulk_transportability"]
sample_metadata[, notes := fifelse(
  diagnosis == "Control",
  "Decidua from induced abortion control sample; metadata requires manual curation",
  "Decidua from recurrent spontaneous abortion sample; metadata requires manual curation"
)]

qc <- data.table(
  dataset_id = "GSE113790",
  n_genes = nrow(expr_log2),
  n_samples = length(sample_cols),
  sample_columns = paste(sample_cols, collapse = ","),
  annotation_columns = paste(annotation_cols, collapse = ","),
  normalization = "log2(FPKM + 1)",
  source_file = infile
)

fwrite(annot, file.path(qc_dir, "GSE113790_gene_annotation.tsv"), sep = "\t")
fwrite(expr, file.path(qc_dir, "GSE113790_expression_matrix_fpkm.tsv"), sep = "\t")
fwrite(expr_log2, file.path(qc_dir, "GSE113790_normalized_expression_log2.tsv"), sep = "\t")
fwrite(sample_metadata, file.path(qc_dir, "GSE113790_sample_metadata_curated.tsv"), sep = "\t")
fwrite(qc, file.path(qc_dir, "GSE113790_expression_qc.tsv"), sep = "\t")

saveRDS(expr_log2, file.path(out_dir, "GSE113790_normalized_expression_log2.rds"))

message("[GSE113790] Wrote normalized expression, sample metadata and QC files.")
print(qc)
print(sample_metadata)
