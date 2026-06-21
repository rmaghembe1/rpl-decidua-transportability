suppressPackageStartupMessages({
  library(data.table)
  library(ggplot2)
})

message("[figures] Plotting combined two-cohort GSE214607 bulk transportability results")

scores_files <- c(
  GSE161969 = "results/projection_scores/GSE161969_GSE214607_projection_scores_annotated.tsv",
  GSE113790 = "results/projection_scores/GSE113790_GSE214607_projection_scores_annotated.tsv"
)

summary_file <- "results/transportability/GSE214607_signature_projection_combined_bulk_transportability.tsv"
concordance_file <- "results/transportability/GSE214607_signature_projection_bulk_concordance_summary.tsv"

for (ff in c(scores_files, summary_file, concordance_file)) {
  if (!file.exists(ff)) stop("[figures] Missing file: ", ff)
}

scores <- rbindlist(lapply(names(scores_files), function(ds) {
  x <- fread(scores_files[[ds]])
  x[, dataset_id := ds]
  x
}), use.names = TRUE, fill = TRUE)

combined <- fread(summary_file)
concordance <- fread(concordance_file)

# Harmonise case/control labels for plotting.
scores[, plot_group := fifelse(
  diagnosis == "Control",
  "Control",
  fifelse(diagnosis %in% c("RPL", "RSA"), "Case", as.character(diagnosis))
)]

scores[, dataset_label := fifelse(
  dataset_id == "GSE161969",
  "GSE161969\nRPL vs control\nn=4 vs 3",
  fifelse(
    dataset_id == "GSE113790",
    "GSE113790\nRSA vs control\nn=3 vs 3",
    dataset_id
  )
)]

target_sig <- "GSE214607_RM_decidua_inflammatory_macrophage_APC_up"

target_scores <- scores[signature_id == target_sig]
target_summary <- combined[signature_id == target_sig]

if (nrow(target_scores) == 0) stop("[figures] No scores found for target signature: ", target_sig)

target_scores[, plot_group := factor(plot_group, levels = c("Control", "Case"))]

p1 <- ggplot(target_scores, aes(x = plot_group, y = score)) +
  geom_boxplot(outlier.shape = NA, width = 0.55) +
  geom_jitter(width = 0.08, height = 0, size = 2.3, alpha = 0.85) +
  facet_wrap(~ dataset_label, nrow = 1, scales = "free_y") +
  labs(
    title = "Transportability of GSE214607 RM decidual macrophage/APC programme",
    subtitle = "Projection into two independent bulk decidua cohorts",
    x = NULL,
    y = "Programme score"
  ) +
  theme_bw(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    strip.text = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(face = "bold")
  )

ggsave(
  "results/figures/GSE214607_macrophage_APC_two_cohort_boxplot.png",
  p1,
  width = 8.5,
  height = 4.5,
  dpi = 600
)

ggsave(
  "results/figures/GSE214607_macrophage_APC_two_cohort_boxplot.svg",
  p1,
  width = 8.5,
  height = 4.5
)

# All-signature delta summary.
delta_plot <- copy(combined)

delta_plot[, dataset_label := fifelse(
  dataset_id == "GSE161969",
  "GSE161969",
  fifelse(dataset_id == "GSE113790", "GSE113790", dataset_id)
)]

delta_plot[, short_label := fifelse(
  signature_id == "GSE214607_RM_decidua_inflammatory_macrophage_APC_up",
  "RM decidua\nmacrophage/APC",
  fifelse(
    signature_id == "GSE214607_decidua_immune_stromal_identity_up",
    "Decidua immune/\nstromal identity",
    fifelse(
      signature_id == "GSE214607_villi_trophoblast_epithelial_identity_up",
      "Villi trophoblast/\nepithelial identity",
      "RM villi structural/\ntrophoblast down"
    )
  )
)]

delta_plot[, short_label := factor(
  short_label,
  levels = c(
    "RM decidua\nmacrophage/APC",
    "Decidua immune/\nstromal identity",
    "Villi trophoblast/\nepithelial identity",
    "RM villi structural/\ntrophoblast down"
  )
)]

p2 <- ggplot(
  delta_plot,
  aes(
    x = short_label,
    y = delta_mean_case_minus_control,
    group = dataset_label,
    shape = dataset_label
  )
) +
  geom_hline(yintercept = 0, linewidth = 0.4) +
  geom_point(size = 3.2, position = position_dodge(width = 0.45)) +
  labs(
    title = "Cross-cohort directional recurrence of GSE214607-derived programmes",
    subtitle = "Positive values indicate higher projected programme score in RPL/RSA cases",
    x = NULL,
    y = "Delta mean programme score\n(case minus control)",
    shape = "Bulk cohort"
  ) +
  theme_bw(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    axis.text.x = element_text(face = "bold")
  )

ggsave(
  "results/figures/GSE214607_all_signature_two_cohort_delta_summary.png",
  p2,
  width = 9.5,
  height = 5,
  dpi = 600
)

ggsave(
  "results/figures/GSE214607_all_signature_two_cohort_delta_summary.svg",
  p2,
  width = 9.5,
  height = 5
)

# Manuscript-ready compact table for figure caption/supporting table.
caption_table <- concordance[, .(
  signature_id,
  programme_label,
  n_datasets,
  n_positive,
  n_negative,
  min_pct_present,
  mean_delta,
  deltas_by_dataset,
  concordance_call,
  evidence_boundary
)]

fwrite(
  caption_table,
  "results/figures/GSE214607_two_cohort_figure_caption_support.tsv",
  sep = "\t"
)

message("[figures] Wrote:")
message("  results/figures/GSE214607_macrophage_APC_two_cohort_boxplot.png")
message("  results/figures/GSE214607_macrophage_APC_two_cohort_boxplot.svg")
message("  results/figures/GSE214607_all_signature_two_cohort_delta_summary.png")
message("  results/figures/GSE214607_all_signature_two_cohort_delta_summary.svg")
message("  results/figures/GSE214607_two_cohort_figure_caption_support.tsv")

print(caption_table)
