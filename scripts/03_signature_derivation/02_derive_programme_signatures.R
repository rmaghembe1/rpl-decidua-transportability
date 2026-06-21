suppressPackageStartupMessages({
  library(data.table)
})

message("[signatures] Deriving exploratory GSE214607 pseudobulk programme candidates")

pb_file <- "results/pseudobulk/GSE214607_pseudobulk_log2CPM.tsv"
meta_file <- "results/qc/GSE214607_pseudobulk_qc.tsv"
out_dir <- "results/signatures"
qc_dir <- "results/qc"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(qc_dir, recursive = TRUE, showWarnings = FALSE)

if (!file.exists(pb_file)) stop("[signatures] Missing pseudobulk log2CPM: ", pb_file)
if (!file.exists(meta_file)) stop("[signatures] Missing pseudobulk metadata: ", meta_file)

pb <- fread(pb_file)
meta <- fread(meta_file)

sample_cols <- setdiff(names(pb), c("gene_id", "gene_symbol"))
mat <- as.matrix(pb[, ..sample_cols])
rownames(mat) <- pb$gene_id
storage.mode(mat) <- "numeric"

gene_annot <- pb[, .(gene_id, gene_symbol)]

# Ensure metadata order matches matrix columns.
meta <- meta[match(sample_cols, sample_prefix)]

if (!identical(meta$sample_prefix, sample_cols)) {
  stop("[signatures] Sample order mismatch.")
}

contrast_effect <- function(mat, meta, group_a_idx, group_b_idx, contrast_id, contrast_label) {
  if (sum(group_a_idx) < 2 || sum(group_b_idx) < 2) {
    warning("[signatures] Contrast has small n: ", contrast_id)
  }

  mean_a <- rowMeans(mat[, group_a_idx, drop = FALSE], na.rm = TRUE)
  mean_b <- rowMeans(mat[, group_b_idx, drop = FALSE], na.rm = TRUE)
  delta <- mean_a - mean_b

  sd_all <- apply(mat[, group_a_idx | group_b_idx, drop = FALSE], 1, sd, na.rm = TRUE)
  sd_all[!is.finite(sd_all) | sd_all == 0] <- NA_real_

  z_effect <- delta / sd_all

  out <- data.table(
    contrast_id = contrast_id,
    contrast_label = contrast_label,
    gene_id = rownames(mat),
    gene_symbol = gene_annot$gene_symbol,
    mean_group_a = mean_a,
    mean_group_b = mean_b,
    delta_log2CPM = delta,
    z_effect = z_effect,
    n_group_a = sum(group_a_idx),
    n_group_b = sum(group_b_idx)
  )

  out <- out[!is.na(gene_symbol) & gene_symbol != ""]
  out[, abs_z_effect := abs(z_effect)]
  out[order(-abs_z_effect)]
}

contrasts <- list(
  RM_decidua_vs_Control_decidua = list(
    a = meta$diagnosis == "RM" & meta$tissue_source == "Decidua",
    b = meta$diagnosis == "Control" & meta$tissue_source == "Decidua",
    label = "RM decidua versus control decidua"
  ),
  RM_villi_vs_Control_villi = list(
    a = meta$diagnosis == "RM" & meta$tissue_source == "Villi",
    b = meta$diagnosis == "Control" & meta$tissue_source == "Villi",
    label = "RM villi versus control villi"
  ),
  Decidua_vs_Villi_all = list(
    a = meta$tissue_source == "Decidua",
    b = meta$tissue_source == "Villi",
    label = "Decidua versus villi across conditions"
  )
)

all_effects <- list()
top_signatures <- list()

for (cid in names(contrasts)) {
  cc <- contrasts[[cid]]

  eff <- contrast_effect(
    mat = mat,
    meta = meta,
    group_a_idx = cc$a,
    group_b_idx = cc$b,
    contrast_id = cid,
    contrast_label = cc$label
  )

  all_effects[[cid]] <- eff

  up <- eff[is.finite(z_effect) & delta_log2CPM > 0][order(-z_effect)][1:min(.N, 50)]
  down <- eff[is.finite(z_effect) & delta_log2CPM < 0][order(z_effect)][1:min(.N, 50)]

  top_signatures[[paste0(cid, "_up")]] <- data.table(
    signature_id = paste0(cid, "_up"),
    contrast_id = cid,
    direction = "up_in_group_a",
    gene_rank = seq_len(nrow(up)),
    gene_id = up$gene_id,
    gene_symbol = up$gene_symbol,
    delta_log2CPM = up$delta_log2CPM,
    z_effect = up$z_effect,
    interpretation_boundary = "Exploratory pseudobulk programme candidate; not a standalone biomarker claim"
  )

  top_signatures[[paste0(cid, "_down")]] <- data.table(
    signature_id = paste0(cid, "_down"),
    contrast_id = cid,
    direction = "down_in_group_a",
    gene_rank = seq_len(nrow(down)),
    gene_id = down$gene_id,
    gene_symbol = down$gene_symbol,
    delta_log2CPM = down$delta_log2CPM,
    z_effect = down$z_effect,
    interpretation_boundary = "Exploratory pseudobulk programme candidate; not a standalone biomarker claim"
  )
}

effects_dt <- rbindlist(all_effects, use.names = TRUE, fill = TRUE)
sig_dt <- rbindlist(top_signatures, use.names = TRUE, fill = TRUE)

fwrite(effects_dt, file.path(out_dir, "GSE214607_pseudobulk_contrast_gene_effects.tsv"), sep = "\t")
fwrite(sig_dt, file.path(out_dir, "GSE214607_exploratory_programme_candidates_top50.tsv"), sep = "\t")

catalogue <- sig_dt[, .(
  n_genes = .N,
  top_genes = paste(head(gene_symbol, 15), collapse = ";")
), by = .(signature_id, contrast_id, direction, interpretation_boundary)]

fwrite(catalogue, file.path(out_dir, "GSE214607_exploratory_programme_candidate_catalogue.tsv"), sep = "\t")

message("[signatures] Wrote exploratory programme candidates.")
print(catalogue)
