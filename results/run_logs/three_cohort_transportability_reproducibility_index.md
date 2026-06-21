# Three-cohort transportability reproducibility index

Date: 2026-06-22

## Analysis focus

Primary result:

- Signature: GSE214607_RM_decidua_inflammatory_macrophage_APC_up
- Programme: recurrent-miscarriage decidual inflammatory macrophage/APC programme
- External bulk cohorts: GSE113790, GSE161969, GSE178535
- Main finding: positive case-associated programme shift in 3/3 independent bulk decidua cohorts
- Evidence boundary: exploratory directional programme recurrence, not statistical validation or standalone biomarker discovery

## Core single-cell-derived input

Projection-ready signature table:

- results/signatures/GSE214607_projection_ready_signature_sets.tsv

Primary projected signature genes:

- FTL
- CD74
- FTH1
- HLA-DRA
- SNX3
- FCGRT
- HLA-DPA1
- HMOX1
- S100A9
- SNX6
- TMEM176B
- CYBA
- RNASET2
- AIF1
- HLA-DPB1
- MS4A7
- NPC2
- C1QB
- S100A8
- ISCU
- C1QC
- C1QA
- CTSZ
- PLTP
- RAB31
- TMSB4X
- TMBIM6
- YWHAH
- SPP1
- GRN

## Bulk cohort inputs

### GSE161969

Input expression:

- results/qc/GSE161969_normalized_expression_log2.tsv

Input metadata:

- results/qc/GSE161969_sample_metadata_curated.tsv

Projection script:

- scripts/05_projection/01_project_gse214607_signatures_into_gse161969.R

Projection outputs:

- results/projection_scores/GSE161969_GSE214607_projection_scores_long.tsv
- results/projection_scores/GSE161969_GSE214607_projection_scores_wide.tsv
- results/projection_scores/GSE161969_GSE214607_projection_scores_annotated.tsv
- results/projection_scores/GSE161969_GSE214607_projection_signature_coverage.tsv
- results/transportability/GSE161969_GSE214607_projection_group_effects.tsv
- results/transportability/GSE161969_GSE214607_projection_transportability_summary.tsv
- results/transportability/GSE161969_GSE214607_projection_transportability_summary_compact.tsv

Primary result:

- n control: 3
- n RPL: 4
- signature coverage: 30/30, 100%
- mean control score: -0.582
- mean RPL score: +0.437
- delta RPL minus control: +1.019
- Wilcoxon p-value: 0.114
- BH FDR: 0.457

### GSE113790

Raw GEO input:

- data/raw/second_bulk_candidates/GSE113790/GSE113790_All_Sample_FPKM_Matrix.txt.gz

Imported expression:

- results/qc/second_bulk_candidates/GSE113790_normalized_expression_log2.tsv

Metadata:

- results/qc/second_bulk_candidates/GSE113790_sample_metadata_curated.tsv

Import/QC script:

- scripts/00_download_second_bulk/02_import_qc_gse113790_matrix.R

Projection script:

- scripts/05_projection/02_project_gse214607_signatures_into_gse113790.R

Projection outputs:

- results/projection_scores/GSE113790_GSE214607_projection_scores_long.tsv
- results/projection_scores/GSE113790_GSE214607_projection_scores_wide.tsv
- results/projection_scores/GSE113790_GSE214607_projection_scores_annotated.tsv
- results/projection_scores/GSE113790_GSE214607_projection_signature_coverage.tsv
- results/transportability/GSE113790_GSE214607_projection_transportability_summary.tsv

Primary result:

- n control: 3
- n RSA: 3
- signature coverage: 30/30, 100%
- mean control score: -0.141
- mean RSA score: +0.141
- delta RSA minus control: +0.282
- Wilcoxon p-value: 0.700
- BH FDR: 0.700

### GSE178535

Raw GEO input:

- data/raw/second_bulk_candidates/GSE178535/GSE178535_count.filter0.nor.log2.csv.gz

Imported expression:

- results/qc/second_bulk_candidates/GSE178535_normalized_expression_log2.tsv

Metadata:

- results/qc/second_bulk_candidates/GSE178535_sample_metadata_curated.tsv

Import/QC script:

- scripts/00_download_second_bulk/04_import_qc_gse178535_matrix.R

Projection script:

- scripts/05_projection/03_project_gse214607_signatures_into_gse178535.R

Projection outputs:

- results/projection_scores/GSE178535_GSE214607_projection_scores_long.tsv
- results/projection_scores/GSE178535_GSE214607_projection_scores_wide.tsv
- results/projection_scores/GSE178535_GSE214607_projection_scores_annotated.tsv
- results/projection_scores/GSE178535_GSE214607_projection_signature_coverage.tsv
- results/transportability/GSE178535_GSE214607_projection_transportability_summary.tsv

Primary result:

- n control: 3
- n RSA: 3
- signature coverage: 30/30, 100%
- mean control score: -0.470
- mean RSA score: +0.470
- delta RSA minus control: +0.941
- Wilcoxon p-value: 0.100
- BH FDR: 0.400

## Combined transportability scripts

Two-cohort combination:

- scripts/06_transportability/01_combine_bulk_transportability_summaries.R

Three-cohort combination:

- scripts/06_transportability/02_combine_three_bulk_transportability_summaries.R

Three-cohort combined outputs:

- results/transportability/GSE214607_signature_projection_three_bulk_transportability.tsv
- results/transportability/GSE214607_signature_projection_three_bulk_concordance_summary.tsv

Three-cohort headline result:

- datasets tested: 3
- positive datasets: 3
- negative datasets: 0
- minimum gene coverage: 100%
- mean delta: +0.747
- median delta: +0.941
- minimum delta: +0.282
- maximum delta: +1.019
- deltas by dataset: GSE113790 +0.282; GSE161969 +1.019; GSE178535 +0.941
- concordance call: concordant_positive_directional_signal

## Figure scripts

Two-cohort figure script:

- scripts/07_figures/03_plot_combined_bulk_transportability.R

Three-cohort figure script:

- scripts/07_figures/04_plot_three_bulk_transportability.R

## Main figure outputs

Main manuscript figure:

- results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.png
- results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.svg

Supporting figure:

- results/figures/GSE214607_all_signature_three_cohort_delta_summary.png
- results/figures/GSE214607_all_signature_three_cohort_delta_summary.svg

Caption/support table:

- results/figures/GSE214607_three_cohort_figure_caption_support.tsv

## Milestone notes

Two-cohort milestone:

- results/run_logs/two_cohort_bulk_transportability_figure_milestone.md

Three-cohort milestone:

- results/run_logs/three_cohort_macrophage_APC_transportability_milestone.md

This reproducibility index:

- results/run_logs/three_cohort_transportability_reproducibility_index.md

## Recommended manuscript statement

A GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme showed concordant positive directional recurrence across three independent bulk decidua cohorts, with complete signature coverage in all cohorts. The finding supports exploratory programme transportability and nominates a macrophage/APC inflammatory decidual tissue-state axis for further investigation, but it should not be framed as statistical validation, causal proof or standalone biomarker discovery.

## Release/GitHub notes

Recommended files to include in a reproducibility release:

- scripts/00_download_second_bulk/02_import_qc_gse113790_matrix.R
- scripts/00_download_second_bulk/04_import_qc_gse178535_matrix.R
- scripts/05_projection/01_project_gse214607_signatures_into_gse161969.R
- scripts/05_projection/02_project_gse214607_signatures_into_gse113790.R
- scripts/05_projection/03_project_gse214607_signatures_into_gse178535.R
- scripts/06_transportability/02_combine_three_bulk_transportability_summaries.R
- scripts/07_figures/04_plot_three_bulk_transportability.R
- results/signatures/GSE214607_projection_ready_signature_sets.tsv
- results/transportability/GSE214607_signature_projection_three_bulk_concordance_summary.tsv
- results/figures/GSE214607_three_cohort_figure_caption_support.tsv

Large raw/intermediate expression files may be regenerated from GEO and do not need to be committed if repository size is a concern.
