# Scientific Reports submission checklist v1.1

## Manuscript

Primary manuscript DOCX:

`manuscript/docx/RPL_decidua_scientific_reports_submission_v1_1.docx`

PDF preview:

`manuscript/pdf_preview/RPL_decidua_scientific_reports_submission_v1_1.pdf`

Source text:

`manuscript/manuscript_full_draft_v1_1_scientific_reports_submission_text.md`

DOCX generation script:

`scripts/make_scirep_docx.py`

## Cover letter

Cover letter draft:

`manuscript/submission/cover_letter_scientific_reports_v1_1.md`

## Repository and reproducibility

GitHub repository:

`https://github.com/rmaghembe1/rpl-decidua-transportability`

Key reproducibility and release files:

- `release/three_cohort_transportability_release_manifest_v1_0.md`
- `release/three_cohort_transportability_release_manifest_v1_0.tsv`
- `results/run_logs/three_cohort_transportability_reproducibility_index.md`
- `results/run_logs/three_cohort_macrophage_APC_transportability_milestone.md`
- `manuscript/qc/manuscript_full_draft_v1_1_scientific_reports_submission_qc_report.txt`
- `manuscript/qc/docx_generation_qc_note_v1_1.txt`

## Main analysis outputs

Primary signature file:

`results/signatures/GSE214607_projection_ready_signature_sets.tsv`

Primary transportability table:

`results/transportability/GSE214607_signature_projection_three_bulk_transportability.tsv`

Primary concordance summary:

`results/transportability/GSE214607_signature_projection_three_bulk_concordance_summary.tsv`

Figure-caption support table:

`results/figures/GSE214607_three_cohort_figure_caption_support.tsv`

## Main figures

Primary macrophage/APC three-cohort boxplot:

- `results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.png`
- `results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.svg`

All-signature delta summary:

- `results/figures/GSE214607_all_signature_three_cohort_delta_summary.png`
- `results/figures/GSE214607_all_signature_three_cohort_delta_summary.svg`

## Suggested Scientific Reports upload mapping

### Main manuscript

Upload:

`manuscript/docx/RPL_decidua_scientific_reports_submission_v1_1.docx`

### Cover letter

Use text from:

`manuscript/submission/cover_letter_scientific_reports_v1_1.md`

### Figures

Upload figure files separately if requested by the submission system.

Recommended figure files:

- Figure 1: `results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.png`
- Figure 2: `results/figures/GSE214607_all_signature_three_cohort_delta_summary.png`

Use SVG versions only if the journal system accepts editable vector source files.

### Supplementary tables

Recommended supplementary table mapping:

- Supplementary Table S1: dataset metadata and sample inclusion framework.
- Supplementary Table S2: GSE214607-derived projection-ready signature gene sets.
- Supplementary Table S3: three-cohort signature projection and transportability statistics.
- Supplementary Table S4: figure caption support and reproducibility audit.

Candidate source files:

- `results/signatures/GSE214607_projection_ready_signature_sets.tsv`
- `results/transportability/GSE214607_signature_projection_three_bulk_transportability.tsv`
- `results/transportability/GSE214607_signature_projection_three_bulk_concordance_summary.tsv`
- `results/figures/GSE214607_three_cohort_figure_caption_support.tsv`
- `release/three_cohort_transportability_release_manifest_v1_0.tsv`

## Final manual checks before submission

1. Open the DOCX in Word or LibreOffice and inspect:
   - title block;
   - author affiliations;
   - abstract;
   - section heading hierarchy;
   - tables;
   - references;
   - supporting-information captions.

2. Open the PDF preview and inspect:
   - page breaks;
   - table widths;
   - reference wrapping;
   - figure-caption placement;
   - final-page layout.

3. Confirm repository link is active:
   - `https://github.com/rmaghembe1/rpl-decidua-transportability`

4. Decide whether to archive the GitHub release on Zenodo before submission.
   - If archived, add DOI to the Data Availability Statement.
   - If not archived, the GitHub URL can remain as the live code/data availability link.

5. Confirm all cited public accessions are correct:
   - GSE214607
   - SRP400574
   - GSE161969
   - SRP293708
   - GSE113790
   - SRP143517
   - GSE178535

6. Confirm central claim remains conservative:
   - programme-level transportability;
   - exploratory;
   - observational;
   - no causality claim;
   - no diagnostic-performance claim;
   - no clinical-utility claim;
   - no standalone biomarker validation claim.

7. Confirm declarations:
   - no competing interests;
   - no specific external funding;
   - public de-identified data only;
   - author contribution statement present;
   - acknowledgments present.

8. Confirm Scientific Reports submission fields:
   - article type: Research Article;
   - title;
   - short title;
   - abstract;
   - keywords if requested;
   - author affiliations;
   - corresponding author email;
   - data availability statement;
   - competing interests;
   - funding statement;
   - suggested reviewers if requested.

## Suggested keywords

- Recurrent pregnancy loss
- Recurrent miscarriage
- Decidua
- Maternal-fetal interface
- Single-cell RNA-seq
- Transcriptomic transportability
- Macrophages
- Antigen-presenting cells
- Reproductive immunology
- Public transcriptomic reanalysis

## Submission status

Current status:

Ready for final manual DOCX/PDF visual inspection and upload preparation.

Latest manuscript package version:

v1.1 Scientific Reports-style submission package.
