# Two-cohort bulk transportability figure milestone

Date: 2026-06-22

## Completed analysis

GSE214607-derived recurrent-miscarriage maternal-fetal-interface programme signatures were projected into two independent bulk decidua cohorts:

- GSE161969: RPL vs control decidua, n=4 vs n=3
- GSE113790: recurrent spontaneous abortion vs induced-abortion control decidua, n=3 vs n=3

## Primary figure-ready signal

The strongest cross-cohort result is the recurrent-miscarriage decidual inflammatory macrophage/APC programme:

- Signature: GSE214607_RM_decidua_inflammatory_macrophage_APC_up
- Programme label: RM decidua inflammatory macrophage/APC programme up
- Datasets tested: 2
- Positive case-shift datasets: 2/2
- Minimum signature coverage across cohorts: 100%
- Mean delta across cohorts: +0.650
- GSE113790 delta: +0.282
- GSE161969 delta: +1.019
- Concordance call: concordant_positive_directional_signal

## Interpretation

This supports exploratory cross-cohort recurrence of a single-cell-derived recurrent-miscarriage decidual macrophage/APC programme in independent bulk decidua transcriptomes.

The result should not be described as statistical validation or as a standalone diagnostic biomarker. Both bulk cohorts are small, and the evidence is best framed as directional programme transportability.

## Secondary signals

- Decidua immune/stromal identity programme: positive in 2/2 cohorts; weaker/context-dependent.
- Villi trophoblast/epithelial identity programme: positive in 2/2 decidua bulk cohorts; interpret cautiously because it is villi-derived.
- RM villi structural/trophoblast-associated programme: mixed direction across cohorts.

## Generated figure files

Main figure:

- results/figures/GSE214607_macrophage_APC_two_cohort_boxplot.png
- results/figures/GSE214607_macrophage_APC_two_cohort_boxplot.svg

Secondary/supporting figure:

- results/figures/GSE214607_all_signature_two_cohort_delta_summary.png
- results/figures/GSE214607_all_signature_two_cohort_delta_summary.svg

Supporting table:

- results/figures/GSE214607_two_cohort_figure_caption_support.tsv

Combined transportability tables:

- results/transportability/GSE214607_signature_projection_combined_bulk_transportability.tsv
- results/transportability/GSE214607_signature_projection_bulk_concordance_summary.tsv

## Manuscript boundary statement

A GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme showed concordant positive directional projection in two independent bulk decidua cohorts, with complete gene coverage in both datasets. Because both validation cohorts were small, this finding is interpreted as exploratory programme recurrence rather than statistical validation or biomarker discovery.
