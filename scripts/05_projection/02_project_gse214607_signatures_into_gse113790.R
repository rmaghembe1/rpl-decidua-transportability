suppressPackageStartupMessages({
  library(data.table)
})

message("[projection] Projecting GSE214607 signatures into GSE113790 bulk decidua matrix")

expr_file <- "results/qc/second_bulk_candidates/GSE113790_normalized_expression_log2.tsv"
meta_file <- "results/qc/second_bulk_candidates/GSE113790_sample_metadata_curated.tsv"
sig_file <- "results/signatures/GSE214607_projection_ready_signature_sets.tsv"

out_dir <- "results/projection_scores"
transport_dir <- "results/transportability"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(transport_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(expr_file)) stop("[projection] Missing GSE113790 expression file: ", expr_file)
if (!file.exists(meta_file)) stop("[projection] Missing GSE113790 metadata file: ", meta_file)
if (!file.exists(sig_file)) stop("[projection] Missing signature file: ", sig_file)

expr <- fread(expr_file)
meta <- fread(meta_file)
sig <- fread(sig_file)

gene_col <- "gene_symbol"
sample_cols <- setdiff(names(expr), gene_col)
sample_cols <- sample_cols[sample_cols %in% meta$expression_sample_id]

if (length(sample_cols) == 0) {
  stop("[projection] No expression sample columns matched metadata expression_sample_id.")
}

mat <- as.matrix(expr[, ..sample_cols])
rownames(mat) <- expr[[gene_col]]
storage.mode(mat) <- "numeric"

if (anyDuplicated(rownames(mat)) > 0) {
  message("[projection] Collapsing duplicated gene symbols by mean")
  dt <- data.table(gene_symbol = rownames(mat), mat, check.names = FALSE)
  dt <- dt[, lapply(.SD, mean, na.rm = TRUE), by = gene_symbol]
  mat <- as.matrix(dt[, -1])
  rownames(mat) <- dt$gene_symbol
  storage.mode(mat) <- "numeric"
}

zmat <- t(scale(t(mat)))
zmat[!is.finite(zmat)] <- NA_real_

parse_genes <- function(x) {
  genes <- unique(trimws(unlist(strsplit(x, "[,;| ]+"))))
  genes[genes != ""]
}

score_list <- list()
coverage_list <- list()

for (i in seq_len(nrow(sig))) {
  sid <- sig$signature_id[i]
  genes <- parse_genes(sig$gene_symbols[i])
  present <- intersect(genes, rownames(zmat))
  missing <- setdiff(genes, rownames(zmat))

  if (length(present) == 0) {
    scores <- rep(NA_real_, ncol(zmat))
  } else {
    scores <- colMeans(zmat[present, , drop = FALSE], na.rm = TRUE)
  }

  score_list[[sid]] <- data.table(
    sample_id = colnames(zmat),
    signature_id = sid,
    programme_label = sig$programme_label[i],
    score = as.numeric(scores)
  )

  coverage_list[[sid]] <- data.table(
    signature_id = sid,
    programme_label = sig$programme_label[i],
    n_signature_genes = length(genes),
    n_present = length(present),
    n_missing = length(missing),
    pct_present = 100 * length(present) / length(genes),
    present_genes = paste(present, collapse = ","),
    missing_genes = paste(missing, collapse = ",")
  )
}

scores_long <- rbindlist(score_list, use.names = TRUE, fill = TRUE)
coverage <- rbindlist(coverage_list, use.names = TRUE, fill = TRUE)

scores_wide <- dcast(
  scores_long,
  sample_id ~ signature_id,
  value.var = "score"
)

scores_annot <- merge(
  scores_long,
  meta,
  by.x = "sample_id",
  by.y = "expression_sample_id",
  all.x = TRUE
)

effects <- scores_annot[
  diagnosis %in% c("Control", "RSA"),
  .(
    n_control = sum(diagnosis == "Control"),
    n_case = sum(diagnosis == "RSA"),
    mean_control = mean(score[diagnosis == "Control"], na.rm = TRUE),
    mean_case = mean(score[diagnosis == "RSA"], na.rm = TRUE),
    median_control = median(score[diagnosis == "Control"], na.rm = TRUE),
    median_case = median(score[diagnosis == "RSA"], na.rm = TRUE),
    delta_mean_case_minus_control =
      mean(score[diagnosis == "RSA"], na.rm = TRUE) -
      mean(score[diagnosis == "Control"], na.rm = TRUE),
    wilcox_p = tryCatch(
      wilcox.test(score ~ diagnosis)$p.value,
      error = function(e) NA_real_
    )
  ),
  by = .(signature_id, programme_label)
]

effects[, wilcox_fdr_bh := p.adjust(wilcox_p, method = "BH")]
effects[, abs_delta := abs(delta_mean_case_minus_control)]

effects <- merge(
  effects,
  coverage[, .(
    signature_id,
    n_signature_genes,
    n_present,
    pct_present,
    missing_genes
  )],
  by = "signature_id",
  all.x = TRUE
)

effects[, transportability_interpretation := fifelse(
  delta_mean_case_minus_control > 0.75 & pct_present >= 90,
  "positive_directional_transportability_signal",
  fifelse(
    abs(delta_mean_case_minus_control) <= 0.25 & pct_present >= 90,
    "weak_or_neutral_transportability_signal",
    "exploratory_or_context_dependent_signal"
  )
)]

effects[, statistical_boundary := "Pilot only: GSE113790 has n=3 controls and n=3 RSA; directional effect should not be interpreted as statistically confirmed"]

setorder(effects, -abs_delta)

fwrite(scores_long, file.path(out_dir, "GSE113790_GSE214607_projection_scores_long.tsv"), sep = "\t")
fwrite(scores_wide, file.path(out_dir, "GSE113790_GSE214607_projection_scores_wide.tsv"), sep = "\t")
fwrite(scores_annot, file.path(out_dir, "GSE113790_GSE214607_projection_scores_annotated.tsv"), sep = "\t")
fwrite(coverage, file.path(out_dir, "GSE113790_GSE214607_projection_signature_coverage.tsv"), sep = "\t")
fwrite(effects, file.path(transport_dir, "GSE113790_GSE214607_projection_transportability_summary.tsv"), sep = "\t")

message("[projection] Coverage:")
print(coverage[, .(signature_id, n_signature_genes, n_present, pct_present)])

message("[projection] GSE113790 group effects:")
print(effects[, .(
  signature_id,
  pct_present,
  mean_control,
  mean_case,
  delta_mean_case_minus_control,
  wilcox_p,
  wilcox_fdr_bh,
  transportability_interpretation
)])
