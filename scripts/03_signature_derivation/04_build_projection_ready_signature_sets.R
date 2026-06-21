suppressPackageStartupMessages({
  library(data.table)
})

message("[projectable] Building projection-ready GSE214607 signature sets")

top_file <- "results/signatures/GSE214607_interpretable_programme_candidates_top50.tsv"
out_dir <- "results/signatures"
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(top_file)) stop("[projectable] Missing top candidate file: ", top_file)

top <- fread(top_file)

make_sig <- function(dt, signature_id, programme_label, max_genes = 30) {
  genes <- unique(dt$gene_symbol)
  genes <- genes[!is.na(genes) & genes != ""]
  genes <- head(genes, max_genes)

  data.table(
    signature_id = signature_id,
    programme_label = programme_label,
    gene_symbols = paste(genes, collapse = ","),
    n_genes = length(genes),
    source_dataset = "GSE214607",
    source_layer = "single_cell_pseudobulk_log2CPM",
    evidence_level = "exploratory_projection_ready",
    interpretation_boundary = "Derived from GSE214607 pseudobulk contrasts; intended for transportability scoring, not standalone biomarker claim"
  )
}

sig1 <- make_sig(
  top[
    contrast_id == "RM_decidua_vs_Control_decidua" &
      direction == "up_in_group_a"
  ],
  "GSE214607_RM_decidua_inflammatory_macrophage_APC_up",
  "RM decidua inflammatory macrophage/APC programme up"
)

sig2 <- make_sig(
  top[
    contrast_id == "Decidua_vs_Villi_all" &
      direction == "up_in_group_a"
  ],
  "GSE214607_decidua_immune_stromal_identity_up",
  "Decidua-enriched immune/stromal identity programme"
)

sig3 <- make_sig(
  top[
    contrast_id == "Decidua_vs_Villi_all" &
      direction == "down_in_group_a"
  ],
  "GSE214607_villi_trophoblast_epithelial_identity_up",
  "Villi-enriched trophoblast/epithelial identity programme"
)

sig4 <- make_sig(
  top[
    contrast_id == "RM_villi_vs_Control_villi" &
      direction == "down_in_group_a"
  ],
  "GSE214607_RM_villi_structural_trophoblast_down",
  "RM villi reduced structural/trophoblast-associated programme"
)

sig <- rbindlist(list(sig1, sig2, sig3, sig4), use.names = TRUE, fill = TRUE)

fwrite(sig, file.path(out_dir, "GSE214607_projection_ready_signature_sets.tsv"), sep = "\t")

message("[projectable] Wrote projection-ready signatures:")
print(sig)
