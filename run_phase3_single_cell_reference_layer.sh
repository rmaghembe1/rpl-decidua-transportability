#!/usr/bin/env bash
set -euo pipefail

bash scripts/00_setup/check_sc_environment.sh
Rscript scripts/00_download/01_prepare_sc_accessions.R
Rscript scripts/02_sc_processing/01_import_sc_references.R
Rscript scripts/02_sc_processing/02_standardize_sc_objects.R
Rscript scripts/03_annotation/01_marker_annotation_qc.R
Rscript scripts/03_signature_derivation/01_build_pseudobulk_profiles.R
Rscript scripts/03_signature_derivation/02_derive_programme_signatures.R
Rscript scripts/07_figures/01_write_phase3_sc_report.R

echo "Phase 3 scaffold run completed. See results/run_logs/ and results/qc/."
