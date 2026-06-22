# Results v0.1

## Public dataset structure and analytical overview

We designed a single-cell-informed transcriptomic transportability workflow to test whether recurrent-miscarriage-associated decidual tissue-state programmes could be detected across independent bulk decidua transcriptomic cohorts. The analysis used GSE214607 as the primary disease single-cell reference and three external bulk decidua cohorts for projection-based validation: GSE161969, GSE113790 and GSE178535.

GSE214607 provided first-trimester single-cell data from control and recurrent-miscarriage samples, including decidua and villi compartments. This enabled derivation of disease-associated and tissue-associated programmes in a reference dataset that preserved maternal-fetal-interface tissue context. The external bulk datasets provided independent case-control transcriptomic cohorts for testing whether compact GSE214607-derived signatures showed directional recurrence outside the discovery reference.

The analytical strategy was intentionally programme-based rather than gene-classifier-based. We first derived candidate tissue-state programmes from the single-cell/pseudobulk reference, then filtered them for interpretability and compactness, and finally projected the resulting signatures into each bulk cohort. Transportability was evaluated using signature gene coverage, direction of case-minus-control programme-score shift and concordance across independent cohorts.

## GSE214607 single-cell/pseudobulk processing generated projection-ready disease and tissue programmes

Raw GSE214607 10x Genomics matrices were imported and summarized into sample-level pseudobulk profiles after quality-control filtering. The imported dataset contained control decidua, control villi, recurrent-miscarriage decidua and recurrent-miscarriage villi samples. Pseudobulk aggregation was used to avoid treating individual cells as independent biological replicates and to generate sample-level profiles suitable for programme derivation.

Pseudobulk contrasts were used to identify recurrent-miscarriage-associated and tissue-associated expression shifts. These contrasts included recurrent-miscarriage decidua versus control decidua, recurrent-miscarriage villi versus control villi and decidua versus villi. Initial candidate lists contained both interpretable tissue-state genes and low-information or technical features. Therefore, candidate signatures were filtered to remove low-interpretability noncoding, housekeeping, ribosomal, mitochondrial and technical features while retaining informative maternal-fetal-interface marker genes.

This process yielded four compact projection-ready GSE214607-derived signatures: a recurrent-miscarriage decidual inflammatory macrophage/APC programme, a decidua immune-stromal identity programme, a villi trophoblast/epithelial identity programme and a recurrent-miscarriage villi structural/trophoblast programme. These signatures were carried forward for bulk projection.

## A recurrent-miscarriage decidual inflammatory macrophage/APC programme emerged as the most coherent disease-associated signature

Among the GSE214607-derived signatures, the recurrent-miscarriage decidual inflammatory macrophage/APC programme was the most coherent disease-associated axis. The programme was derived from the recurrent-miscarriage decidua versus control decidua contrast and contained genes consistent with macrophage/APC activation, antigen presentation, inflammatory myeloid state and complement-associated macrophage identity.

The compact macrophage/APC signature included HLA class II and antigen-presentation genes, myeloid activation markers and complement-associated macrophage genes, including C1QA, C1QB and C1QC. The biological structure of this programme supported interpretation as a decidual inflammatory macrophage/APC tissue-state axis rather than an isolated list of differentially expressed genes.

Because this programme was disease-associated in the decidual contrast, biologically interpretable and technically suitable for projection, it was designated as the primary programme of interest for external bulk transportability testing. The other signatures were retained as secondary tissue-context or comparison programmes.

## The macrophage/APC programme showed complete gene coverage in all external bulk cohorts

We next projected the four GSE214607-derived signatures into three independent external bulk decidua cohorts: GSE161969, GSE113790 and GSE178535. Signature gene coverage was high across cohorts. The recurrent-miscarriage decidual inflammatory macrophage/APC programme showed complete gene coverage in all three datasets, with all 30 signature genes detected in each cohort.

This complete coverage supported robust technical projection of the primary programme across independent bulk expression matrices. Other signatures also showed high coverage, although occasional genes were absent from some datasets. The high coverage profile indicated that the main programme-level comparisons were not driven by poor gene recovery or extensive signature dropout.

## The macrophage/APC programme showed concordant positive directional recurrence across three bulk decidua cohorts

The recurrent-miscarriage decidual inflammatory macrophage/APC programme showed a positive case-associated shift in all three independent bulk cohorts. In GSE161969, the programme showed a case-minus-control delta of +1.019. In GSE113790, the delta was +0.282. In GSE178535, the delta was +0.941. Across the three cohorts, the programme was positive in 3/3 datasets, with a mean delta of +0.747 and a median delta of +0.941.

This pattern supports concordant positive directional recurrence of the GSE214607-derived macrophage/APC programme across independent recurrent pregnancy loss or recurrent spontaneous abortion bulk decidua transcriptomes. The magnitude of the shift varied across cohorts, as expected given differences in dataset size, expression processing, cohort composition and sampling context. Nevertheless, the direction of effect was consistent across all three external datasets.

Because the external cohorts were small, these results were interpreted primarily through directional concordance rather than formal statistical significance. Cohort-level Wilcoxon tests and adjusted values were treated as descriptive and exploratory. The main result is therefore not a validated diagnostic biomarker, but a reproducible programme-level signal: an inflammatory decidual macrophage/APC tissue-state axis derived from single-cell data recurs directionally in independent bulk decidua datasets.

## Secondary signatures showed weaker or context-dependent transportability

The decidua immune-stromal identity programme showed positive but weaker shifts across the three cohorts. This may reflect partial recurrence of decidual tissue-context signals in bulk decidua data, but its smaller deltas and broader biological composition make it less specific as a recurrent-miscarriage-associated disease programme.

The villi trophoblast/epithelial identity signature showed modest positive shifts in bulk decidua cohorts, whereas the recurrent-miscarriage villi structural/trophoblast programme showed mixed or weak behaviour. These findings are consistent with tissue-context dependence: signatures derived from villi or trophoblast-enriched contrasts may not be expected to transport strongly into decidua-focused bulk datasets. Their weaker behaviour strengthens the interpretation that the macrophage/APC programme is not simply a generic projection artifact across all signatures.

Overall, the secondary-signature analysis supported the specificity of the primary observation. The most coherent and consistently recurrent programme was the decidual inflammatory macrophage/APC axis, while non-primary tissue-context signatures showed weaker, neutral or mixed behaviour.

## Summary of results

Together, these analyses identified a single-cell-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme with complete technical coverage and positive directional recurrence across three independent bulk decidua cohorts. The finding supports cross-dataset transportability of an interpretable decidual inflammatory myeloid tissue-state axis in recurrent pregnancy loss. However, the evidence remains exploratory and observational because the external cohorts are small and public metadata are incompletely harmonized. The result should therefore be interpreted as programme-level recurrence rather than causal proof, diagnostic validation or standalone biomarker discovery.
