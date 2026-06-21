# Three-cohort macrophage/APC transportability milestone

Date: 2026-06-22

## Completed analysis

A GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme was projected into three independent bulk decidua cohorts:

- GSE113790: RSA vs induced-abortion control decidua, n=3 vs n=3
- GSE161969: RPL vs control decidua, n=4 vs n=3
- GSE178535: RSA vs healthy-control decidua, n=3 vs n=3

## Primary result

Signature:

- GSE214607_RM_decidua_inflammatory_macrophage_APC_up

Programme label:

- RM decidua inflammatory macrophage/APC programme up

Cross-cohort result:

- Datasets tested: 3
- Positive case-shift datasets: 3/3
- Minimum signature coverage: 100%
- Mean delta across cohorts: +0.747
- Median delta across cohorts: +0.941
- Minimum delta: +0.282
- Maximum delta: +1.019
- Concordance call: concordant_positive_directional_signal

Dataset-level deltas:

- GSE113790: +0.282
- GSE161969: +1.019
- GSE178535: +0.941

## Interpretation

This result supports exploratory recurrence of a single-cell-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme across independent bulk decidua transcriptomes.

The finding should be described as directional programme transportability or exploratory cross-cohort programme recurrence. It should not be described as statistical validation, causal proof, or standalone biomarker discovery, because the three external bulk cohorts are small.

## Secondary programme results

- GSE214607_decidua_immune_stromal_identity_up: positive in 3/3 cohorts but smaller and more variable; mean delta +0.270.
- GSE214607_villi_trophoblast_epithelial_identity_up: positive in 3/3 cohorts but should be interpreted cautiously because it is villi-derived and projected into bulk decidua; mean delta +0.232.
- GSE214607_RM_villi_structural_trophoblast_down: mixed direction across cohorts; not transportable.

## Main figure files

- results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.png
- results/figures/GSE214607_macrophage_APC_three_cohort_boxplot.svg

## Supporting figure files

- results/figures/GSE214607_all_signature_three_cohort_delta_summary.png
- results/figures/GSE214607_all_signature_three_cohort_delta_summary.svg

## Supporting result tables

- results/figures/GSE214607_three_cohort_figure_caption_support.tsv
- results/transportability/GSE214607_signature_projection_three_bulk_transportability.tsv
- results/transportability/GSE214607_signature_projection_three_bulk_concordance_summary.tsv

## Manuscript-ready Results subsection

A recurrent-miscarriage decidual inflammatory macrophage/APC programme shows directional recurrence across three independent bulk decidua cohorts

Having derived projection-ready tissue-state programmes from the GSE214607 single-cell/pseudobulk reference, we next asked whether these programmes were detectable in independent bulk decidua transcriptomes. Four compact GSE214607-derived programme signatures were projected into three external bulk cohorts: GSE161969, GSE113790 and GSE178535. Across cohorts, gene coverage was high for all projected signatures, with complete coverage for the recurrent-miscarriage decidual inflammatory macrophage/APC programme in every dataset.

The strongest and most reproducible signal was observed for the GSE214607 recurrent-miscarriage decidual inflammatory macrophage/APC programme. This programme showed a positive case-associated shift in all three independent bulk cohorts. The mean case-minus-control delta was +1.019 in GSE161969, +0.282 in GSE113790 and +0.941 in GSE178535. Across the three cohorts, the programme was positive in 3/3 datasets, had 100% minimum gene coverage, and showed a mean delta of +0.747 and median delta of +0.941. This pattern supports concordant directional recurrence of a single-cell-derived decidual macrophage/APC inflammatory state in independent RPL/RSA bulk decidua transcriptomes.

The secondary programmes showed weaker or less specific behaviour. The decidua-enriched immune/stromal identity programme was positive in all three cohorts but with smaller and more variable deltas. The villi-enriched trophoblast/epithelial programme also showed positive directionality in all three bulk decidua cohorts, but this signal was interpreted cautiously because the programme was derived from a villi-enriched contrast and may reflect tissue-composition or epithelial/trophoblast-associated transcriptional variation rather than a decidua-specific disease axis. The recurrent-miscarriage villi structural/trophoblast-associated programme showed mixed directionality and was not considered transportable across bulk decidua cohorts.

Together, these findings nominate the recurrent-miscarriage decidual inflammatory macrophage/APC programme as the primary cross-cohort transportability signal. Because each external bulk cohort was small, these results should be interpreted as exploratory evidence of programme recurrence rather than statistical validation or biomarker discovery.

## Manuscript-ready figure legend

Figure X. Three-cohort transportability of a GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme.

A compact recurrent-miscarriage decidual inflammatory macrophage/APC programme derived from the GSE214607 single-cell/pseudobulk reference was projected into three independent bulk decidua cohorts: GSE113790, GSE161969 and GSE178535. Programme scores are shown for control and RPL/RSA case samples within each cohort. The macrophage/APC programme showed a positive case-associated shift in all three datasets, with complete gene coverage in each cohort. Case-minus-control deltas were +0.282 in GSE113790, +1.019 in GSE161969 and +0.941 in GSE178535, giving a mean delta of +0.747 across cohorts. This result is interpreted as exploratory directional recurrence of a decidual inflammatory macrophage/APC tissue-state programme, not as statistical validation or standalone biomarker evidence.
