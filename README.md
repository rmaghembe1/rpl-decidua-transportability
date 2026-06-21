# RPL decidua transportability - Phase 3 single-cell reference layer v0.6

This package expands the pilot bulk workflow into the single-cell reference layer for the manuscript project:

**Single-cell-informed transcriptomic transportability of decidual immune-tolerance disruption and stromal-remodelling programmes in recurrent pregnancy loss**

## Purpose

Phase 3 prepares the single-cell disease/reference resources needed to derive interpretable maternal-fetal-interface programmes before projection into bulk RPL/RSA/RM datasets.

Primary targets:

1. `GSE214607` - disease single-cell decidua/villi recurrent miscarriage reference.
2. `GSE164449` - unexplained RPL CD45+ decidual immune-cell reference.
3. `GSE169269` - macrophage-specific RSA sensitivity reference.
4. `E-MTAB-6701` / Vento-Tormo - normal first-trimester MFI reference, prepared as a downstream normal-atlas reference.

## Recommended run order

```bash
bash scripts/00_setup/check_sc_environment.sh
Rscript scripts/00_download/01_prepare_sc_accessions.R
Rscript scripts/02_sc_processing/01_import_sc_references.R
Rscript scripts/02_sc_processing/02_standardize_sc_objects.R
Rscript scripts/03_annotation/01_marker_annotation_qc.R
Rscript scripts/03_signature_derivation/01_build_pseudobulk_profiles.R
Rscript scripts/03_signature_derivation/02_derive_programme_signatures.R
Rscript scripts/07_figures/01_write_phase3_sc_report.R
```

## Interpretation boundary

Phase 3 does **not** claim causality or diagnostic biomarkers. It creates evidence-graded single-cell programme definitions for later cross-dataset bulk transportability testing.

---

## Three-cohort transportability result: recurrent-miscarriage decidual macrophage/APC programme

This release contains a reproducible three-cohort transportability analysis centred on a GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme.

### Primary finding

A compact macrophage/APC programme derived from the GSE214607 single-cell/pseudobulk reference showed concordant positive directional projection across three independent bulk decidua cohorts:

- GSE113790
- GSE161969
- GSE178535

The programme had complete gene coverage in all three cohorts and showed a positive case-associated shift in 3/3 datasets.

### Headline numerical summary

- Signature: `GSE214607_RM_decidua_inflammatory_macrophage_APC_up`
- Positive cohorts: 3/3
- Minimum signature coverage: 100%
- Mean case-minus-control delta: +0.747
- Median case-minus-control delta: +0.941
- Dataset-level deltas:
  - GSE113790: +0.282
  - GSE161969: +1.019
  - GSE178535: +0.941
- Concordance call: `concordant_positive_directional_signal`

### Evidence boundary

This result should be interpreted as exploratory directional programme recurrence and cross-cohort transportability. It should not be described as statistical validation, causal proof or standalone biomarker discovery, because the external bulk cohorts are small.

### Main result files

- `results/transportability/GSE214607_signature_projection_three_bulk_transportability.tsv`
- `results/transportability/GSE214607_signature_projection_three_bulk_concordance_summary.tsv`
- `results/figures/GSE214607_three_cohort_figure_caption_support.tsv`

### Main figure files

- `results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.png`
- `results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.svg`

### Supporting figure files

- `results/figures/GSE214607_all_signature_three_cohort_delta_summary.png`
- `results/figures/GSE214607_all_signature_three_cohort_delta_summary.svg`

### Reproducibility and release files

- `results/run_logs/three_cohort_transportability_reproducibility_index.md`
- `results/run_logs/three_cohort_macrophage_APC_transportability_milestone.md`
- `release/three_cohort_transportability_release_manifest_v1_0.md`
- `release/three_cohort_transportability_release_manifest_v1_0.tsv`
- `results/run_logs/three_cohort_release_manifest_include_file_check.tsv`

### Suggested citation language for manuscript/reporting

A GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme showed concordant positive directional recurrence across three independent bulk decidua cohorts, with complete signature coverage in all cohorts. This nominates a macrophage/APC inflammatory decidual tissue-state axis for further investigation, while remaining exploratory and non-diagnostic.
