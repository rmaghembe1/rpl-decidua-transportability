#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
})

message("[Phase 3] Marker annotation QC scaffold")
markers <- read_tsv("markers/mfi_marker_panel_v0_6.tsv", show_col_types = FALSE)
markers_long <- markers %>%
  tidyr::separate_rows(marker_genes, sep = ",") %>%
  mutate(marker_genes = trimws(marker_genes))
write_tsv(markers_long, "results/qc/mfi_marker_panel_long_v0_6.tsv")
message("Wrote results/qc/mfi_marker_panel_long_v0_6.tsv")
