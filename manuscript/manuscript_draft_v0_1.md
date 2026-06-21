# Single-cell-informed transcriptomic transportability of decidual immune-state programmes in recurrent pregnancy loss

## Working title

Single-cell-informed transcriptomic transportability of decidual inflammatory macrophage/APC programmes in recurrent pregnancy loss

## Central manuscript claim

Recurrent pregnancy loss and recurrent spontaneous abortion bulk decidua transcriptomes contain a recurrent, directionally concordant signal corresponding to a single-cell-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme. This signal is observed across three independent external bulk cohorts, with complete gene coverage for the macrophage/APC programme in all cohorts. The finding supports cross-dataset transportability of an interpretable decidual inflammatory tissue-state programme, but does not constitute causal proof, diagnostic validation or standalone biomarker discovery.

## Abstract scaffold

### Background

Recurrent pregnancy loss is associated with disruption of maternal-fetal immune tolerance, decidual remodelling and inflammatory imbalance, but bulk transcriptomic studies have often produced dataset-specific gene lists with limited interpretability across cohorts. Single-cell transcriptomic references of the maternal-fetal interface now provide an opportunity to define cell-state-informed tissue programmes and test whether these programmes are detectable across independent bulk decidua datasets.

### Objective

To evaluate whether recurrent-miscarriage-associated decidual tissue-state programmes derived from a single-cell/pseudobulk reference are transportable into independent bulk transcriptomic cohorts of recurrent pregnancy loss or recurrent spontaneous abortion.

### Methods

We used GSE214607 as a disease single-cell/pseudobulk reference containing first-trimester decidua and villi from control and recurrent-miscarriage samples. Projection-ready recurrent-miscarriage-associated programmes were derived from pseudobulk contrasts, filtered for interpretability and compactness, and projected into three independent bulk decidua cohorts: GSE161969, GSE113790 and GSE178535. Programme scores were calculated using matched gene signatures after within-cohort standardization. Transportability was assessed by gene coverage, direction of case-minus-control shift, cohort-level deltas and cross-cohort concordance.

### Results

Four GSE214607-derived projection-ready programmes were evaluated across external bulk cohorts. The strongest and most reproducible signal was a recurrent-miscarriage decidual inflammatory macrophage/APC programme. This programme had complete gene coverage in all three bulk cohorts and showed positive case-associated shifts in GSE161969, GSE113790 and GSE178535. Dataset-level case-minus-control deltas were +1.019, +0.282 and +0.941, respectively, giving a mean delta of +0.747 and positive directional recurrence in 3/3 cohorts. Secondary programmes showed weaker or context-dependent transportability.

### Conclusions

A single-cell-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme shows concordant directional recurrence across three independent bulk decidua transcriptomic cohorts. These results support programme-level transportability of an inflammatory decidual macrophage/APC tissue-state axis in recurrent pregnancy loss, while requiring cautious interpretation because the external cohorts are small and the analysis is computational and observational.

## Introduction scaffold

Recurrent pregnancy loss remains a clinically and biologically heterogeneous reproductive disorder. Although chromosomal, anatomical, endocrine, thrombotic and immunological factors may contribute in subsets of patients, a substantial proportion of cases remain unexplained. At the maternal-fetal interface, successful early pregnancy requires coordinated decidualization, trophoblast invasion, vascular adaptation and immune tolerance. Disruption of this coordinated tissue state may contribute to pregnancy failure, but the molecular signatures of such disruption are difficult to interpret from bulk transcriptomes alone.

Several transcriptomic studies have compared decidual or endometrial tissues from recurrent pregnancy loss, recurrent spontaneous abortion or control pregnancies. Many have reported differential genes, immune-related pathways or candidate biomarkers. However, individual gene lists are often sensitive to tissue composition, sample size, gestational age, platform and analytical choices. This limits direct biological interpretation and makes it difficult to distinguish robust tissue-state programmes from dataset-specific signals.

Single-cell and single-nucleus transcriptomic atlases of the maternal-fetal interface provide higher-resolution views of decidual immune, stromal, endothelial and trophoblast compartments. These references allow disease-associated programmes to be defined in terms of interpretable cellular and tissue-state axes. A transportability framework can then ask a different question from conventional biomarker discovery: not whether one dataset yields a diagnostic gene signature, but whether a biologically interpretable programme recurs directionally across independent datasets.

Here, we developed a single-cell-informed transcriptomic transportability analysis focused on recurrent pregnancy loss. Using GSE214607 as a disease single-cell/pseudobulk reference, we derived compact recurrent-miscarriage-associated tissue-state programmes and projected them into three independent bulk decidua cohorts. We hypothesized that recurrent-miscarriage-associated inflammatory immune programmes, particularly macrophage/APC-related states, would show stronger cross-cohort transportability than villi- or context-specific structural programmes.

## Methods scaffold

### Study design

This was a retrospective computational reanalysis of public transcriptomic datasets. The study used a single-cell/pseudobulk disease reference to derive interpretable recurrent-miscarriage-associated programmes and tested programme transportability in independent bulk decidua cohorts.

### Single-cell disease reference

GSE214607 was used as the primary disease single-cell reference. The dataset contained first-trimester decidua and villi samples from control and recurrent-miscarriage groups. Raw 10x matrices were imported, sample metadata were curated from sample identifiers, and cells were assigned to tissue and disease strata. Pseudobulk profiles were generated at the sample level after cell-level quality control.

### Programme derivation

Pseudobulk contrasts were used to identify recurrent-miscarriage-associated and tissue-associated candidate programmes. Candidate genes were filtered to remove low-interpretability noncoding, housekeeping and technical features, while preserving biologically informative maternal-fetal-interface marker genes. Compact projection-ready signatures were then generated for four programme axes: recurrent-miscarriage decidual inflammatory macrophage/APC up, decidua immune-stromal identity, villi trophoblast/epithelial identity and recurrent-miscarriage villi structural/trophoblast down.

### External bulk cohorts

Three independent bulk decidua cohorts were used for transportability testing: GSE161969, GSE113790 and GSE178535. Processed expression matrices were imported from public supplementary files, sample metadata were curated, and gene-level expression matrices were harmonized to gene symbols. Cohort-specific normalization followed the processed data available for each cohort, with scoring performed within each dataset to avoid cross-platform scale assumptions.

### Projection scoring

For each bulk cohort, signature genes were intersected with the available gene symbols. Within each cohort, expression values were standardized across samples for each gene, and programme scores were calculated as the mean standardized expression of present signature genes. Signature coverage was recorded as the number and percentage of signature genes present in each cohort.

### Transportability assessment

Transportability was evaluated using three criteria: signature gene coverage, direction of case-minus-control programme-score shift and concordance across independent cohorts. For each signature and cohort, mean programme scores were compared between control and RPL/RSA samples, and case-minus-control deltas were computed. Because cohort sample sizes were small, statistical tests were treated as descriptive and exploratory rather than confirmatory.

### Reproducibility

All scripts, compact signatures, curated metadata, programme-score outputs, transportability summaries, figures and release documentation were deposited in the GitHub repository: https://github.com/rmaghembe1/rpl-decidua-transportability.

## Results scaffold

### Construction of a single-cell-informed programme reference

We first generated pseudobulk profiles from GSE214607, a single-cell reference containing control and recurrent-miscarriage decidua and villi samples. Pseudobulk contrasts separated tissue-associated decidua-villi programmes from recurrent-miscarriage-associated decidual programmes. After interpretability filtering, we derived four compact projection-ready signatures for downstream transportability analysis.

### A recurrent-miscarriage decidual macrophage/APC programme emerged as the most interpretable disease-associated axis

Among the derived signatures, the recurrent-miscarriage decidual inflammatory macrophage/APC programme was the most biologically coherent disease-associated programme. It included genes related to antigen presentation, macrophage/APC activation, complement-associated macrophage identity and inflammatory myeloid state, including HLA class II genes, C1QA, C1QB, C1QC, CD68-associated myeloid markers and inflammatory response genes.

### The macrophage/APC programme had complete gene coverage in all external bulk cohorts

The macrophage/APC programme was projected into GSE161969, GSE113790 and GSE178535. Signature coverage was complete in all three cohorts, supporting technical suitability for cross-dataset scoring. Other signatures also showed high coverage, but the macrophage/APC programme had the strongest combination of biological coherence, complete coverage and directional recurrence.

### The macrophage/APC programme showed positive case-associated shifts in three independent bulk cohorts

The recurrent-miscarriage decidual inflammatory macrophage/APC programme showed a positive case-associated shift in all three external bulk decidua datasets. The case-minus-control delta was +1.019 in GSE161969, +0.282 in GSE113790 and +0.941 in GSE178535. Across cohorts, the programme was positive in 3/3 datasets, with a mean delta of +0.747 and median delta of +0.941.

### Secondary signatures showed weaker or context-dependent transportability

The decidua immune-stromal identity signature showed positive but weaker shifts across cohorts. Villi trophoblast/epithelial and recurrent-miscarriage villi structural/trophoblast signatures showed weaker, neutral or mixed behaviour when projected into bulk decidua cohorts. This pattern supports tissue-context specificity and suggests that the macrophage/APC programme is the most transportable disease-associated axis in the current analysis.

## Discussion scaffold

### Principal finding

This study identifies a recurrent-miscarriage-associated decidual inflammatory macrophage/APC programme that shows concordant directional recurrence across three independent bulk decidua transcriptomic cohorts. The result supports the value of single-cell-informed programme transportability analysis for extracting interpretable tissue-state signals from small and heterogeneous reproductive transcriptomic datasets.

### Biological interpretation

The macrophage/APC programme suggests that recurrent pregnancy loss may involve a reproducible decidual myeloid inflammatory state detectable across independent datasets. This does not imply that macrophages alone cause pregnancy loss. Rather, it indicates that a macrophage/APC-associated inflammatory tissue-state axis is repeatedly elevated in case samples across cohorts and may reflect altered immune regulation, antigen presentation, complement-associated macrophage activation, tissue repair or inflammatory remodelling at the maternal-fetal interface.

### Why programme transportability matters

The analysis avoids the common limitation of dataset-specific DEG lists by testing compact, interpretable, single-cell-informed programmes across independent cohorts. Directional recurrence of a programme is more biologically meaningful than recurrence of individual genes alone, especially when sample sizes are small and platforms differ.

### Boundaries and limitations

This study is computational and observational. The external bulk cohorts are small, and available metadata do not fully harmonize gestational age, fetal karyotype, tissue composition, clinical subtype, treatment history or sampling procedure. Programme scores may reflect both cell-state changes and cell-composition shifts. The findings should therefore be interpreted as exploratory evidence of programme recurrence, not as causal proof, diagnostic validation or a clinically deployable biomarker.

### Future directions

Future work should validate this macrophage/APC tissue-state axis in larger decidua cohorts with richer clinical metadata, fetal karyotype information and matched histological or spatial data. Spatial transcriptomics, multiplex imaging or targeted immune profiling could determine whether the programme localizes to specific decidual niches and whether it reflects macrophage abundance, activation state, antigen-presentation activity or interaction with trophoblast, stromal or vascular compartments.

## Figure plan

1. Study design schematic: single-cell disease reference to pseudobulk programme derivation to compact projection-ready signatures to projection into three independent bulk cohorts.
2. GSE214607 programme derivation and interpretability filtering.
3. Primary three-cohort macrophage/APC transportability result.
4. All-signature delta summary across cohorts.
5. Supplementary dataset processing, QC and signature coverage summary.

## Table plan

1. Public datasets used in the study.
2. Projection-ready GSE214607-derived signatures.
3. Three-cohort transportability summary.
4. Full signature gene lists.
5. Cohort-specific projection scores.
6. Cohort-specific metadata curation and diagnostic-label harmonization.

## Best-fit journal framing

This manuscript should be framed for a reproductive biology, placenta, pregnancy-loss or computational transcriptomics audience. The strongest positioning is not new biomarker discovery, but rather a reproducible single-cell-informed framework for testing whether decidual disease-state programmes recur across independent recurrent pregnancy loss transcriptomic cohorts.
