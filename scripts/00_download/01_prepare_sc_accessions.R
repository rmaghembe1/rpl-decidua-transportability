#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
})

message("[Phase 3] Preparing single-cell accession manifest")
plan <- read_tsv("config/sc_accession_plan_v0_6.tsv", show_col_types = FALSE)
dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
dir.create("results/run_logs", recursive = TRUE, showWarnings = FALSE)
write_tsv(plan, "data/raw/sc_accession_manifest_v0_6.tsv")
writeLines(c(
  "Phase 3 accession manifest prepared.",
  paste("Datasets:", paste(plan$dataset_id, collapse = ", ")),
  "Manual download may be required for large HCA/ArrayExpress/CELLxGENE files."
), "results/run_logs/phase3_accession_preparation_log.txt")
message("Wrote data/raw/sc_accession_manifest_v0_6.tsv")
