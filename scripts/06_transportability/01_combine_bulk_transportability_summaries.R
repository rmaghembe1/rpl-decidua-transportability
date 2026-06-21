suppressPackageStartupMessages({
  library(data.table)
})

message("[combine] Combining GSE161969 and GSE113790 transportability summaries")

gse161_file <- "results/transportability/GSE161969_GSE214607_projection_transportability_summary_compact.tsv"
gse113_file <- "results/transportability/GSE113790_GSE214607_projection_transportability_summary.tsv"

if (!file.exists(gse161_file)) stop("[combine] Missing file: ", gse161_file)
if (!file.exists(gse113_file)) stop("[combine] Missing file: ", gse113_file)

gse161 <- fread(gse161_file)
gse113 <- fread(gse113_file)

gse161_std <- gse161[, .(
  dataset_id = "GSE161969",
  case_label = "RPL",
  signature_id,
  programme_label,
  n_control,
  n_case = n_rpl,
  pct_present,
  mean_control,
  mean_case = mean_rpl,
  delta_mean_case_minus_control = delta_mean_rpl_minus_control,
  wilcox_p,
  wilcox_fdr_bh,
  transportability_interpretation,
  statistical_boundary
)]

gse113_std <- gse113[, .(
  dataset_id = "GSE113790",
  case_label = "RSA",
  signature_id,
  programme_label,
  n_control,
  n_case,
  pct_present,
  mean_control,
  mean_case,
  delta_mean_case_minus_control,
  wilcox_p,
  wilcox_fdr_bh,
  transportability_interpretation,
  statistical_boundary
)]

combined <- rbindlist(list(gse161_std, gse113_std), use.names = TRUE, fill = TRUE)

combined[, direction := fifelse(
  delta_mean_case_minus_control > 0,
  "positive_case_shift",
  fifelse(delta_mean_case_minus_control < 0, "negative_case_shift", "neutral")
)]

combined[, evidence_boundary := "Cross-cohort directional transportability only; not statistical validation or standalone biomarker evidence"]

setorder(combined, signature_id, dataset_id)

fwrite(
  combined,
  "results/transportability/GSE214607_signature_projection_combined_bulk_transportability.tsv",
  sep = "\t"
)

concordance <- combined[, .(
  n_datasets = .N,
  n_positive = sum(delta_mean_case_minus_control > 0, na.rm = TRUE),
  n_negative = sum(delta_mean_case_minus_control < 0, na.rm = TRUE),
  min_pct_present = min(pct_present, na.rm = TRUE),
  mean_delta = mean(delta_mean_case_minus_control, na.rm = TRUE),
  deltas_by_dataset = paste(dataset_id, round(delta_mean_case_minus_control, 3), sep = ":", collapse = ";")
), by = .(signature_id, programme_label)]

concordance[, concordance_call := fifelse(
  n_positive == n_datasets & min_pct_present >= 90,
  "concordant_positive_directional_signal",
  fifelse(
    n_negative == n_datasets & min_pct_present >= 90,
    "concordant_negative_directional_signal",
    "mixed_or_weak_directional_signal"
  )
)]

concordance[, evidence_boundary := "Concordance is based on two small independent bulk cohorts; interpret as exploratory programme recurrence"]

setorder(concordance, -mean_delta)

fwrite(
  concordance,
  "results/transportability/GSE214607_signature_projection_bulk_concordance_summary.tsv",
  sep = "\t"
)

message("[combine] Combined transportability:")
print(combined[, .(
  dataset_id,
  signature_id,
  pct_present,
  delta_mean_case_minus_control,
  wilcox_p,
  direction
)])

message("[combine] Concordance summary:")
print(concordance)
