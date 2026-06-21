# Three-cohort transportability release manifest v1.0

## Purpose

This manifest defines which files should be included in a GitHub or reproducibility release for the recurrent-pregnancy-loss decidua transportability analysis centred on the GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme.

## Core result

A GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme showed concordant positive directional recurrence across three independent bulk decidua cohorts:

- GSE113790
- GSE161969
- GSE178535

The signature had complete coverage in all three cohorts and showed a positive case-associated programme shift in all three datasets.

This is interpreted as exploratory programme transportability, not statistical validation, causal proof or standalone biomarker discovery.

## Include in GitHub release

### Documentation

- README.md
- docs/phase3_single_cell_reference_notes_v0_6.md
- results/run_logs/three_cohort_transportability_reproducibility_index.md
- results/run_logs/three_cohort_macrophage_APC_transportability_milestone.md

### Core scripts

- scripts/00_download_second_bulk/01_audit_gse113790_geo_files.R
- scripts/00_download_second_bulk/02_import_qc_gse113790_matrix.R
- scripts/00_download_second_bulk/03_audit_gse178535_geo_files.R
- scripts/00_download_second_bulk/04_import_qc_gse178535_matrix.R
- scripts/05_projection/01_project_gse214607_signatures_into_gse161969.R
- scripts/05_projection/02_project_gse214607_signatures_into_gse113790.R
- scripts/05_projection/03_project_gse214607_signatures_into_gse178535.R
- scripts/06_transportability/02_combine_three_bulk_transportability_summaries.R
- scripts/07_figures/04_plot_three_bulk_transportability.R

### Compact derived inputs

- results/signatures/GSE214607_projection_ready_signature_sets.tsv
- results/qc/GSE161969_sample_metadata_curated.tsv
- results/qc/second_bulk_candidates/GSE113790_sample_metadata_curated.tsv
- results/qc/second_bulk_candidates/GSE178535_sample_metadata_curated.tsv

### Primary results

- results/transportability/GSE214607_signature_projection_three_bulk_transportability.tsv
- results/transportability/GSE214607_signature_projection_three_bulk_concordance_summary.tsv
- results/figures/GSE214607_three_cohort_figure_caption_support.tsv

### Figures

- results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.png
- results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.svg
- results/figures/GSE214607_all_signature_three_cohort_delta_summary.png
- results/figures/GSE214607_all_signature_three_cohort_delta_summary.svg

## Regenerate or exclude from GitHub

The following files should usually not be committed to GitHub if repository size is a concern:

- data/raw/GSE214607/GSE214607_RAW.tar
- data/processed/GSE214607/GSE214607_combined_counts_sparse.rds
- data/raw/second_bulk_candidates/GSE113790/GSE113790_All_Sample_FPKM_Matrix.txt.gz
- data/raw/second_bulk_candidates/GSE178535/GSE178535_count.filter0.nor.log2.csv.gz
- results/qc/GSE161969_normalized_expression_log2.tsv
- results/qc/second_bulk_candidates/GSE113790_normalized_expression_log2.tsv
- results/qc/second_bulk_candidates/GSE178535_normalized_expression_log2.tsv

These files can be regenerated from public GEO inputs using the included scripts, or stored separately in Zenodo/OSF if a fully frozen data snapshot is required.

## Suggested GitHub release note

Release v1.0 contains the reproducible three-cohort transportability analysis showing that a GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme projects positively across three independent bulk decidua cohorts. The release includes scripts, compact signatures, curated sample metadata, transportability summaries, main figures and reproducibility logs. Large raw and intermediate expression matrices are excluded from the GitHub release and should be regenerated from GEO or deposited separately in an archival repository.
