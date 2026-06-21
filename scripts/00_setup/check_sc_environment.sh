#!/usr/bin/env bash
set -euo pipefail

echo "[Phase 3] Checking single-cell workflow environment"
command -v Rscript >/dev/null 2>&1 || { echo "Rscript not found"; exit 1; }
command -v bash >/dev/null 2>&1 || { echo "bash not found"; exit 1; }
mkdir -p data/raw data/processed/sc_objects data/processed/sc_pseudobulk results/qc results/signatures results/figures results/run_logs logs
Rscript -e 'cat(R.version.string, "
")'
echo "Required R packages: Seurat, SingleCellExperiment, Matrix, GEOquery, tidyverse, edgeR, limma, openxlsx, pheatmap, ggplot2"
echo "Install missing packages before running the phase 3 scripts."
