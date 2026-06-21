# Methods v0.1

## Study design and analytical framework

This study was designed as a retrospective computational reanalysis of public transcriptomic datasets from the early maternal-fetal interface. The central analytical objective was not to discover a new diagnostic gene classifier, but to test whether biologically interpretable, single-cell-derived recurrent-miscarriage tissue-state programmes could be detected directionally across independent bulk decidua transcriptomic cohorts.

The workflow had four major stages. First, a disease single-cell reference dataset was processed and summarized at the pseudobulk sample level. Second, recurrent-miscarriage-associated and tissue-associated candidate programmes were derived from pseudobulk contrasts and filtered to generate compact projection-ready gene sets. Third, these signatures were projected into independent bulk decidua cohorts after within-cohort expression harmonization. Fourth, transportability was evaluated using signature gene coverage, direction of case-minus-control programme-score shift and cross-cohort concordance.

Because all datasets were public and de-identified, the analysis was conducted as a secondary computational study. The study was observational and exploratory; no causal inference, diagnostic performance claim or clinical biomarker validation was attempted.

## Single-cell disease reference dataset

GSE214607 was used as the primary disease single-cell reference. This dataset contains first-trimester decidua and villi samples from control and recurrent-miscarriage groups. Raw 10x Genomics matrix files were obtained from the GEO supplementary archive and imported as sparse count matrices. Sample identifiers were parsed to assign tissue group and disease status, distinguishing control decidua, control villi, recurrent-miscarriage decidua and recurrent-miscarriage villi samples.

For each sample, matrix, barcode and feature files were checked for presence and dimensional consistency before import. Gene identifiers and gene symbols were retained in the gene metadata. Per-cell quality-control metrics included total counts and number of detected genes. Cells passing the predefined minimum feature threshold were retained for pseudobulk summarization.

## Pseudobulk construction from GSE214607

To obtain sample-level expression profiles suitable for disease and tissue contrasts, single-cell counts from GSE214607 were aggregated into pseudobulk profiles by sample. Raw counts were summed across retained cells within each sample. Library-size-normalized log2 counts per million were then calculated for each pseudobulk sample. This produced a sample-level matrix representing control decidua, recurrent-miscarriage decidua, control villi and recurrent-miscarriage villi.

Pseudobulk summarization was used to reduce single-cell sparsity and to avoid treating individual cells as independent biological replicates. The resulting pseudobulk profiles were used only for programme derivation and not for formal differential expression claims.

## Candidate programme derivation

Candidate programme genes were derived from pseudobulk contrasts designed to separate recurrent-miscarriage-associated signals from tissue-associated signals. The main contrasts included recurrent-miscarriage decidua versus control decidua, recurrent-miscarriage villi versus control villi and decidua versus villi across available samples.

For each contrast, genes were ranked by direction and magnitude of group-associated expression shift. Candidate upregulated and downregulated gene sets were generated from the highest-ranking genes in each contrast. These initial candidate lists were treated as exploratory and were not interpreted as standalone differential expression results.

## Interpretability filtering and projection-ready signature construction

Candidate gene lists were filtered to improve interpretability before projection into bulk cohorts. Low-interpretability noncoding, housekeeping, ribosomal, mitochondrial and technical features were excluded unless they had explicit biological relevance to a maternal-fetal-interface programme. Marker genes from a curated maternal-fetal-interface marker panel were preserved where appropriate to retain interpretability of decidual immune, stromal, vascular and trophoblast compartments.

After filtering, compact projection-ready signatures were created. Four GSE214607-derived programmes were retained for external bulk projection:

1. recurrent-miscarriage decidual inflammatory macrophage/APC up programme;
2. decidua immune-stromal identity programme;
3. villi trophoblast/epithelial identity programme;
4. recurrent-miscarriage villi structural/trophoblast programme.

The recurrent-miscarriage decidual inflammatory macrophage/APC programme was selected as the primary biological programme of interest because it was disease-associated in the decidual contrast, biologically coherent and highly interpretable. The other three signatures were retained as secondary or tissue-context comparison programmes.

## External bulk decidua cohorts

Three independent bulk transcriptomic cohorts were used for transportability testing: GSE161969, GSE113790 and GSE178535. These datasets were selected because they contained decidual or decidua-enriched transcriptomic profiles from control and recurrent pregnancy loss or recurrent spontaneous abortion groups, and because public processed expression matrices were available.

For each bulk cohort, supplementary expression files were downloaded or audited from GEO, imported into R and harmonized to gene-symbol-level expression matrices. Sample metadata were manually curated from public sample identifiers, file headers and cohort-specific naming conventions. Diagnostic labels were harmonized into control and case categories, while preserving the original dataset-specific terminology where available.

For GSE161969, the available processed matrix contained FPKM values, which were transformed as log2(FPKM + 1) after gene-symbol harmonization. For GSE113790, the processed FPKM matrix was imported, gene symbols were retained and duplicated gene symbols were collapsed where necessary. For GSE178535, the public processed normalized log2 expression matrix was used without additional log transformation. All downstream scoring was performed within each dataset to avoid assuming direct comparability of expression scales across platforms or preprocessing pipelines.

## Signature projection into bulk cohorts

For each external bulk cohort, each projection-ready signature was intersected with the cohort gene-symbol expression matrix. Signature coverage was calculated as the number and percentage of genes present in the bulk dataset. Programme scoring was restricted to genes present in each cohort.

Within each cohort, expression values for each gene were standardized across samples. Programme scores were then calculated for each sample as the mean standardized expression of the present genes in the signature. This within-cohort z-score-based scoring approach allowed directionally comparable programme scores while minimizing dependence on absolute expression scale across datasets.

## Transportability assessment

Transportability was evaluated using three main criteria: technical coverage, within-cohort direction of case-associated programme shift and cross-cohort concordance. Technical coverage was considered strong when most or all signature genes were detected in the bulk dataset. For each signature and cohort, mean programme scores were calculated for control and case groups, and case-minus-control deltas were computed.

The primary transportability criterion was directional recurrence across independent cohorts. A programme was considered to show concordant positive directional recurrence if the case-minus-control delta was positive in all three external bulk cohorts. Wilcoxon rank-sum tests and Benjamini-Hochberg-adjusted values were calculated descriptively where applicable, but were not used as the primary evidence criterion because the external cohorts were small.

## Evidence boundaries

All programme-score comparisons were interpreted as exploratory. The study does not claim that the identified macrophage/APC programme is causal, diagnostic or specific to all forms of recurrent pregnancy loss. Bulk projection scores may reflect changes in cell abundance, cell activation state or both. Available public metadata were insufficient to fully harmonize fetal karyotype, gestational age, clinical subtype, treatment exposure, sampling procedure or tissue-composition differences across cohorts.

The primary claim is therefore limited to programme-level transportability: a single-cell-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme shows concordant positive directional recurrence across three independent bulk decidua transcriptomic cohorts.

## Reproducibility and code availability

All scripts, compact projection-ready signatures, curated metadata, projection scores, signature-coverage tables, transportability summaries, figures and release documentation are available in the GitHub repository:

https://github.com/rmaghembe1/rpl-decidua-transportability

The repository includes release manifests, reproducibility notes and figure-support files documenting the three-cohort transportability analysis.
