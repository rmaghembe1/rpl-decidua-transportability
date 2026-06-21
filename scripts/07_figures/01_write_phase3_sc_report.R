#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(readr)
})

dir.create("results/run_logs", recursive = TRUE, showWarnings = FALSE)
report <- c(
  "# Phase 3 single-cell reference report v0.6",
  "",
  "This report is generated before full object import and records scaffolding outputs.",
  "",
  "Expected next manual/automated steps:",
  "1. Download processed scRNA/snRNA matrices for GSE214607, GSE164449, GSE169269 and E-MTAB-6701.",
  "2. Confirm file formats and sample metadata.",
  "3. Import into Seurat or SingleCellExperiment objects.",
  "4. Harmonize broad cell-type labels.",
  "5. Build pseudobulk profiles and derive evidence-graded programme signatures.",
  "",
  "Interpretation boundary: no biomarker or causal claims at this phase."
)
writeLines(report, "results/run_logs/phase3_sc_reference_report_v0_6.md")
message("Wrote results/run_logs/phase3_sc_reference_report_v0_6.md")
