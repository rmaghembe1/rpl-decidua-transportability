suppressPackageStartupMessages({
  library(data.table)
})

message("[projection] Projecting GSE214607 signatures into GSE161969 bulk matrix")

phase2_dir <- "/mnt/f/RPL_decidua_transportability/rpl_decidua_transportability_phase2_executable_v0_5"

expr_file <- file.path(
  phase2_dir,
  "results/qc/GSE161969_normalized_expression_log2.tsv"
)

meta_file <- file.path(
  phase2_dir,
  "results/qc/GSE161969_sample_metadata_curated.tsv"
)

sig_file <- "results/signatures/GSE214607_projection_ready_signature_sets.tsv"

out_dir <- "results/projection_scores"
transport_dir <- "results/transportability"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(transport_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(expr_file)) stop("[projection] Missing GSE161969 expression file: ", expr_file)
if (!file.exists(meta_file)) stop("[projection] Missing GSE161969 metadata file: ", meta_file)
if (!file.exists(sig_file)) stop("[projection] Missing signature file: ", sig_file)

expr <- fread(expr_file)
meta <- fread(meta_file)
sig <- fread(sig_file)

gene_col <- intersect(c("gene_symbol", "gene_name", "symbol", "gene"), names(expr))[1]

if (is.na(gene_col)) {
  gene_col <- names(expr)[1]
  message("[projection] No explicit gene column detected; using first column: ", gene_col)
}

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
  unique(trimws(unlist(strsplit(x, "[,;| ]+"))))
}

score_list <- list()
coverage_list <- list()

for (i in seq_len(nrow(sig))) {
  sid <- sig$signature_id[i]
  genes <- parse_genes(sig$gene_symbols[i])
  genes <- genes[genes != ""]
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
  diagnosis %in% c("Control", "RPL"),
  .(
    n_control = sum(diagnosis == "Control"),
    n_rpl = sum(diagnosis == "RPL"),
    mean_control = mean(score[diagnosis == "Control"], na.rm = TRUE),
    mean_rpl = mean(score[diagnosis == "RPL"], na.rm = TRUE),
    median_control = median(score[diagnosis == "Control"], na.rm = TRUE),
    median_rpl = median(score[diagnosis == "RPL"], na.rm = TRUE),
    delta_mean_rpl_minus_control =
      mean(score[diagnosis == "RPL"], na.rm = TRUE) -
      mean(score[diagnosis == "Control"], na.rm = TRUE),
    wilcox_p = tryCatch(
      wilcox.test(score ~ diagnosis)$p.value,
      error = function(e) NA_real_
    )
  ),
  by = .(signature_id, programme_label)
]

effects[, wilcox_fdr_bh := p.adjust(wilcox_p, method = "BH")]

fwrite(scores_long, file.path(out_dir, "GSE161969_GSE214607_projection_scores_long.tsv"), sep = "\t")
fwrite(scores_wide, file.path(out_dir, "GSE161969_GSE214607_projection_scores_wide.tsv"), sep = "\t")
fwrite(scores_annot, file.path(out_dir, "GSE161969_GSE214607_projection_scores_annotated.tsv"), sep = "\t")
fwrite(coverage, file.path(out_dir, "GSE161969_GSE214607_projection_signature_coverage.tsv"), sep = "\t")
fwrite(effects, file.path(transport_dir, "GSE161969_GSE214607_projection_group_effects.tsv"), sep = "\t")

message("[projection] Coverage:")
print(coverage[, .(signature_id, n_signature_genes, n_present, pct_present)])

message("[projection] GSE161969 group effects:")
print(effects)
