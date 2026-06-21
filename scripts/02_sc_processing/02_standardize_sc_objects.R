suppressPackageStartupMessages({
  library(data.table)
})

message("[standardize] Building GSE214607 cell QC summaries")

qc_dir <- "results/qc"
cell_meta_file <- file.path(qc_dir, "GSE214607_cell_metadata.tsv")

if (!file.exists(cell_meta_file)) {
  stop("[standardize] Missing cell metadata: ", cell_meta_file)
}

cell_meta <- fread(cell_meta_file)

required <- c(
  "cell_id", "dataset_id", "geo_sample", "sample_prefix",
  "diagnosis", "tissue_source", "donor_or_gestation_code",
  "replicate", "n_counts", "n_features"
)

missing <- setdiff(required, names(cell_meta))
if (length(missing) > 0) {
  stop("[standardize] Missing columns: ", paste(missing, collapse = ", "))
}

cell_meta[, n_counts := as.numeric(n_counts)]
cell_meta[, n_features := as.numeric(n_features)]

cell_meta[, qc_pass_200_features := n_features >= 200]
cell_meta[, qc_pass_500_features := n_features >= 500]
cell_meta[, log10_counts := log10(n_counts + 1)]
cell_meta[, log10_features := log10(n_features + 1)]

by_sample <- cell_meta[, .(
  n_cells = as.integer(.N),
  median_counts = as.numeric(median(n_counts, na.rm = TRUE)),
  median_features = as.numeric(median(n_features, na.rm = TRUE)),
  mean_counts = as.numeric(mean(n_counts, na.rm = TRUE)),
  mean_features = as.numeric(mean(n_features, na.rm = TRUE)),
  pct_lt_200_features = as.numeric(mean(n_features < 200, na.rm = TRUE) * 100),
  pct_lt_500_features = as.numeric(mean(n_features < 500, na.rm = TRUE) * 100),
  pct_ge_500_features = as.numeric(mean(n_features >= 500, na.rm = TRUE) * 100)
), by = .(
  dataset_id, geo_sample, sample_prefix,
  diagnosis, tissue_source, donor_or_gestation_code, replicate
)]

by_group <- cell_meta[, .(
  n_samples = as.integer(uniqueN(sample_prefix)),
  n_cells = as.integer(.N),
  median_counts = as.numeric(median(n_counts, na.rm = TRUE)),
  median_features = as.numeric(median(n_features, na.rm = TRUE)),
  mean_counts = as.numeric(mean(n_counts, na.rm = TRUE)),
  mean_features = as.numeric(mean(n_features, na.rm = TRUE)),
  pct_lt_200_features = as.numeric(mean(n_features < 200, na.rm = TRUE) * 100),
  pct_lt_500_features = as.numeric(mean(n_features < 500, na.rm = TRUE) * 100),
  pct_ge_500_features = as.numeric(mean(n_features >= 500, na.rm = TRUE) * 100)
), by = .(
  dataset_id, diagnosis, tissue_source
)]

setorder(by_sample, diagnosis, tissue_source, donor_or_gestation_code, replicate)
setorder(by_group, diagnosis, tissue_source)

fwrite(cell_meta, file.path(qc_dir, "GSE214607_cell_metadata_qc_augmented.tsv"), sep = "\t")
fwrite(by_sample, file.path(qc_dir, "GSE214607_cell_qc_summary_by_sample.tsv"), sep = "\t")
fwrite(by_group, file.path(qc_dir, "GSE214607_cell_qc_summary_by_group.tsv"), sep = "\t")

message("[standardize] Wrote:")
message("  ", file.path(qc_dir, "GSE214607_cell_metadata_qc_augmented.tsv"))
message("  ", file.path(qc_dir, "GSE214607_cell_qc_summary_by_sample.tsv"))
message("  ", file.path(qc_dir, "GSE214607_cell_qc_summary_by_group.tsv"))

print(by_group)
