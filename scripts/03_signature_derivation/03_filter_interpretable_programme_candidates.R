suppressPackageStartupMessages({
  library(data.table)
})

message("[filter] Filtering exploratory GSE214607 programme candidates for interpretability")

effects_file <- "results/signatures/GSE214607_pseudobulk_contrast_gene_effects.tsv"
marker_file <- "markers/mfi_marker_panel_v0_6.tsv"
out_dir <- "results/signatures"
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(effects_file)) stop("[filter] Missing effects file: ", effects_file)

effects <- fread(effects_file)

if (!"interpretation_boundary" %in% names(effects)) {
  effects[, interpretation_boundary := "Exploratory pseudobulk programme candidate; not a standalone biomarker claim"]
}

marker_genes <- character()

if (file.exists(marker_file)) {
  markers <- fread(marker_file)

  possible_gene_cols <- c(
    "gene_symbol", "gene_symbols", "marker_gene", "marker_genes",
    "marker", "markers", "gene", "symbol"
  )

  gene_cols <- intersect(possible_gene_cols, names(markers))

  if (length(gene_cols) > 0) {
    marker_genes <- unique(unlist(strsplit(
      paste(markers[[gene_cols[1]]], collapse = ";"),
      "[,;| ]+"
    )))
  } else {
    char_cols <- names(markers)[vapply(markers, is.character, logical(1))]
    marker_genes <- unique(unlist(lapply(char_cols, function(cc) {
      unlist(strsplit(paste(markers[[cc]], collapse = ";"), "[,;| ]+"))
    })))
  }

  marker_genes <- marker_genes[
    grepl("^[A-Za-z0-9.-]+$", marker_genes) &
      nchar(marker_genes) >= 2 &
      nchar(marker_genes) <= 30
  ]
}

effects[, gene_symbol := as.character(gene_symbol)]
effects[, mean_max := pmax(mean_group_a, mean_group_b, na.rm = TRUE)]

effects[, low_interpretability_symbol := grepl(
  "^(AC[0-9]|AL[0-9]|AP[0-9]|LINC|MIR|SNORD|SNORA|RNU|RP11-|CTD-|CTA-|MT-|LOC)",
  gene_symbol
)]

effects[, housekeeping_or_technical := grepl(
  "^(RPL|RPS|EEF1|TUBA|TUBB|HSP|HSPA|HSPB|HSPD|HSP90|ACTB|GAPDH|MALAT1$|B2M$)",
  gene_symbol
)]

effects[, marker_panel_gene := gene_symbol %in% marker_genes]

filtered_main <- effects[
  is.finite(z_effect) &
    is.finite(delta_log2CPM) &
    mean_max >= 1 &
    abs(delta_log2CPM) >= 0.25 &
    low_interpretability_symbol == FALSE &
    housekeeping_or_technical == FALSE
]

marker_rescue <- effects[
  marker_panel_gene == TRUE &
    is.finite(z_effect) &
    is.finite(delta_log2CPM) &
    mean_max >= 0.5 &
    housekeeping_or_technical == FALSE
]

filtered <- unique(
  rbindlist(list(filtered_main, marker_rescue), use.names = TRUE, fill = TRUE),
  by = c("contrast_id", "gene_id")
)

filtered[, direction := fifelse(delta_log2CPM > 0, "up_in_group_a", "down_in_group_a")]
filtered[, rank_score := abs(z_effect) * log2(mean_max + 1)]

setorder(filtered, contrast_id, direction, -rank_score)

top_filtered <- filtered[, head(.SD, 50), by = .(contrast_id, direction)]
top_filtered[, gene_rank := seq_len(.N), by = .(contrast_id, direction)]

wanted_cols <- c(
  "contrast_id", "contrast_label", "direction", "gene_rank",
  "gene_id", "gene_symbol", "mean_group_a", "mean_group_b",
  "delta_log2CPM", "z_effect", "rank_score",
  "marker_panel_gene", "mean_max",
  "low_interpretability_symbol", "housekeeping_or_technical",
  "interpretation_boundary"
)

setcolorder(top_filtered, intersect(wanted_cols, names(top_filtered)))

catalogue <- top_filtered[, .(
  n_genes = .N,
  n_marker_panel_genes = sum(marker_panel_gene, na.rm = TRUE),
  marker_panel_genes = paste(gene_symbol[marker_panel_gene == TRUE], collapse = ";"),
  top_genes = paste(head(gene_symbol, 20), collapse = ";")
), by = .(contrast_id, direction, interpretation_boundary)]

fwrite(filtered, file.path(out_dir, "GSE214607_interpretable_programme_candidates_all.tsv"), sep = "\t")
fwrite(top_filtered, file.path(out_dir, "GSE214607_interpretable_programme_candidates_top50.tsv"), sep = "\t")
fwrite(catalogue, file.path(out_dir, "GSE214607_interpretable_programme_candidate_catalogue.tsv"), sep = "\t")

message("[filter] Marker genes detected from marker panel: ", length(marker_genes))
message("[filter] Wrote stricter interpretable candidate programme files.")
print(catalogue)
