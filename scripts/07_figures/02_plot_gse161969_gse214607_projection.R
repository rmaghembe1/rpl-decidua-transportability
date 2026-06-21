suppressPackageStartupMessages({
  library(data.table)
  library(ggplot2)
})

scores_file <- "results/projection_scores/GSE161969_GSE214607_projection_scores_annotated.tsv"
summary_file <- "results/transportability/GSE161969_GSE214607_projection_transportability_summary.tsv"
fig_dir <- "results/figures"

dir.create(fig_dir, recursive = TRUE, showWarnings = FALSE)

scores <- fread(scores_file)
summary <- fread(summary_file)

scores[, diagnosis := factor(diagnosis, levels = c("Control", "RPL"))]

label_map <- unique(scores[, .(signature_id, programme_label)])
label_map[, short_label := fifelse(
  grepl("macrophage", programme_label, ignore.case = TRUE),
  "RM decidua macrophage/APC",
  fifelse(
    grepl("immune/stromal", programme_label, ignore.case = TRUE),
    "Decidua immune/stromal",
    fifelse(
      grepl("trophoblast/epithelial identity", programme_label, ignore.case = TRUE),
      "Villi trophoblast/epithelial",
      "RM villi structural/trophoblast"
    )
  )
)]

scores <- merge(scores, label_map[, .(signature_id, short_label)], by = "signature_id", all.x = TRUE)
scores[, short_label := factor(short_label, levels = label_map$short_label)]

plot_dt <- scores[, .(
  sample_id,
  diagnosis,
  signature_id,
  short_label,
  programme_label,
  score
)]

fwrite(
  plot_dt,
  "results/projection_scores/GSE161969_GSE214607_projection_plotting_input.tsv",
  sep = "\t"
)

p <- ggplot(plot_dt, aes(x = diagnosis, y = score)) +
  geom_boxplot(outlier.shape = NA, width = 0.55) +
  geom_jitter(width = 0.12, height = 0, size = 2.2, alpha = 0.9) +
  facet_wrap(~ short_label, scales = "free_y", ncol = 2) +
  labs(
    title = "GSE214607-derived programmes projected into GSE161969 bulk decidua",
    subtitle = "Pilot transportability scoring; n=3 controls and n=4 RPL",
    x = NULL,
    y = "Mean z-score programme projection"
  ) +
  theme_bw(base_size = 11) +
  theme(
    strip.text = element_text(face = "bold"),
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

ggsave(
  file.path(fig_dir, "GSE161969_GSE214607_projection_boxplots.png"),
  p,
  width = 8,
  height = 6,
  dpi = 600
)

ggsave(
  file.path(fig_dir, "GSE161969_GSE214607_projection_boxplots.svg"),
  p,
  width = 8,
  height = 6
)

compact <- summary[, .(
  signature_id,
  programme_label,
  n_control,
  n_rpl,
  pct_present,
  mean_control,
  mean_rpl,
  delta_mean_rpl_minus_control,
  wilcox_p,
  wilcox_fdr_bh,
  transportability_interpretation,
  statistical_boundary
)]

fwrite(
  compact,
  "results/transportability/GSE161969_GSE214607_projection_transportability_summary_compact.tsv",
  sep = "\t"
)

message("[figures] Wrote:")
message("  results/figures/GSE161969_GSE214607_projection_boxplots.png")
message("  results/figures/GSE161969_GSE214607_projection_boxplots.svg")
message("  results/projection_scores/GSE161969_GSE214607_projection_plotting_input.tsv")
message("  results/transportability/GSE161969_GSE214607_projection_transportability_summary_compact.tsv")
