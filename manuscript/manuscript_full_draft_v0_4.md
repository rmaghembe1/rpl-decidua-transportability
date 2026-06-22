# Single-cell-informed transcriptomic transportability of decidual inflammatory macrophage/APC programmes in recurrent pregnancy loss

> Citation status: v0.4 contains structured reference placeholders in the form `[REF:source_key]`, mapped to `manuscript/references/formal_citation_metadata_v0_1.tsv`. These placeholders should be converted to journal-formatted citations after target-journal selection.


# Abstract

## Structured abstract

### Background

Recurrent pregnancy loss is a clinically heterogeneous reproductive disorder in which a substantial fraction of cases remain unexplained after evaluation for chromosomal, anatomical, endocrine, thrombotic and other recognized contributors. At the maternal-fetal interface, successful early pregnancy requires coordinated decidualization, trophoblast invasion, vascular adaptation and immune tolerance. Bulk transcriptomic studies of recurrent pregnancy loss have reported immune and inflammatory signals, but interpretation is limited by small cohorts, tissue-composition differences and dataset-specific differential gene lists. Single-cell transcriptomic references now provide an opportunity to define interpretable decidual tissue-state programmes and test whether these programmes recur across independent bulk datasets.

### Objective

To determine whether recurrent-miscarriage-associated decidual tissue-state programmes derived from a single-cell/pseudobulk reference are transportable into independent bulk transcriptomic cohorts of recurrent pregnancy loss or recurrent spontaneous abortion.

### Methods

We used GSE214607 as a disease single-cell/pseudobulk reference containing first-trimester decidua and villi samples from control and recurrent-miscarriage groups. Pseudobulk contrasts were used to derive recurrent-miscarriage-associated and tissue-associated candidate programmes. Candidate signatures were filtered for interpretability and converted into compact projection-ready gene sets. Four GSE214607-derived programmes were projected into three independent bulk decidua cohorts: GSE161969 [REF:GSE161969_GEO; REF:GSE161969_paper], GSE113790 [REF:GSE113790_GEO_or_OmicsDI] and GSE178535 [REF:GSE178535_GEO_or_OmicsDI]. Within each bulk cohort, programme scores were calculated from standardized expression of matched signature genes. Transportability was assessed using signature gene coverage, case-minus-control programme-score shifts and directional concordance across cohorts.

### Results

Four projection-ready GSE214607-derived programmes were evaluated across the three external bulk cohorts. The strongest and most reproducible signal was a recurrent-miscarriage decidual inflammatory macrophage/APC programme. This programme had complete gene coverage in all three bulk cohorts and showed positive case-associated shifts in GSE161969, GSE113790 and GSE178535. Dataset-level case-minus-control deltas were +1.019, +0.282 and +0.941, respectively, giving a mean delta of +0.747 and positive directional recurrence in 3/3 cohorts. Secondary programmes, including decidua immune-stromal identity, villi trophoblast/epithelial identity and recurrent-miscarriage villi structural/trophoblast signatures, showed weaker, neutral or context-dependent transportability.

### Conclusions

A single-cell-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme shows concordant directional recurrence across three independent bulk decidua transcriptomic cohorts. These findings support programme-level transportability of an inflammatory decidual macrophage/APC tissue-state axis in recurrent pregnancy loss. The result should be interpreted as exploratory and observational, not as causal proof, diagnostic validation or standalone biomarker discovery.

## Introduction

Recurrent pregnancy loss is a major reproductive health problem with substantial clinical and emotional consequences. Although definitions vary across clinical guidelines and study settings, the condition is generally understood as repeated pregnancy loss occurring before fetal viability. Its causes are heterogeneous and may include parental or fetal chromosomal abnormalities, uterine anatomical factors, endocrine disorders, antiphospholipid syndrome and other maternal or embryonic contributors. Yet many patients remain without a definitive explanation after standard evaluation. This unresolved fraction has motivated increasing interest in the molecular biology of the early maternal-fetal interface, where immune, stromal, vascular and trophoblast compartments must coordinate to support implantation and early placental development.

The decidua is not a passive maternal tissue. It is an actively remodelled mucosal interface that integrates hormonal decidualization, stromal differentiation, vascular adaptation, trophoblast interaction and immune regulation. Decidual natural killer cells, macrophages, T cells, stromal cells, endothelial cells and invading trophoblasts participate in a dynamic tissue ecosystem. In successful early pregnancy, inflammatory competence must coexist with tolerance, tissue repair, angiogenesis and controlled trophoblast invasion. Disruption of this balance has long been proposed as one route to pregnancy failure, but the molecular interpretation of patient tissue data remains challenging because pregnancy-loss specimens vary in gestational age, fetal karyotype, tissue composition, sampling procedure and clinical subtype.

Transcriptomic studies have provided important evidence that recurrent pregnancy loss and recurrent spontaneous abortion can be associated with altered immune and inflammatory gene expression. However, many studies have been limited by small sample sizes and have reported dataset-specific lists of differentially expressed genes. Such lists may capture real biology, but they are difficult to compare directly across cohorts because bulk transcriptomes mix changes in cell abundance, cell state, tissue sampling and platform-specific measurement. As a result, it remains difficult to distinguish robust recurrent tissue-state programmes from cohort-specific or composition-driven signals.

Single-cell and single-nucleus transcriptomic atlases of the maternal-fetal interface offer a way to address this interpretive problem. Rather than treating bulk differential expression as isolated gene-level evidence, single-cell-informed analysis can define biologically interpretable programmes linked to decidual immune, stromal, endothelial or trophoblast compartments. These programmes can then be projected into independent bulk datasets to test whether a tissue-state axis is detectable beyond its discovery cohort. This transportability framing asks a more conservative and reproducible question than biomarker discovery: does an interpretable disease-associated programme recur directionally across independent datasets?

In this study, we developed a single-cell-informed transcriptomic transportability analysis for recurrent pregnancy loss. We used GSE214607 as a disease single-cell/pseudobulk reference containing first-trimester decidua and villi from control and recurrent-miscarriage samples. From this reference, we derived compact projection-ready tissue-state signatures after interpretability filtering. We then projected these signatures into three independent bulk decidua cohorts: GSE161969, GSE113790 and GSE178535. We focused on gene coverage, direction of case-associated shift and cross-cohort concordance rather than on standalone statistical significance, recognizing that the external cohorts are small.

Our central hypothesis was that recurrent-miscarriage-associated decidual inflammatory immune programmes would show stronger cross-cohort transportability than tissue-context-specific villi or structural programmes when projected into bulk decidua. Consistent with this hypothesis, we identified a recurrent-miscarriage decidual inflammatory macrophage/APC programme that showed complete gene coverage and positive directional recurrence across all three external cohorts. This finding nominates a decidual macrophage/APC inflammatory tissue-state axis for further investigation while maintaining clear evidence boundaries: the analysis is computational, observational and exploratory, and it does not establish causality or diagnostic performance.


---
# Methods

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


---
# Results

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


---
# Discussion

## Principal finding

This study identifies a recurrent-miscarriage decidual inflammatory macrophage/APC programme that shows concordant directional recurrence across three independent bulk decidua transcriptomic cohorts. The programme was derived from the GSE214607 single-cell/pseudobulk disease reference, converted into a compact projection-ready signature and then projected into GSE161969, GSE113790 and GSE178535. Across all three external cohorts, the programme showed complete gene coverage and a positive case-associated shift. This supports programme-level transportability of an inflammatory decidual macrophage/APC tissue-state axis in recurrent pregnancy loss and recurrent spontaneous abortion datasets.

The main contribution of this analysis is not the nomination of a single diagnostic gene or classifier. Rather, the study demonstrates that an interpretable single-cell-derived tissue-state programme can be recovered directionally across independent bulk transcriptomic datasets despite small cohort sizes, differences in expression processing and incomplete metadata harmonization. The finding therefore provides a reproducible framework for moving beyond dataset-specific gene lists toward programme-level biological convergence.

## Biological interpretation of the macrophage/APC programme

The recurrent-miscarriage decidual inflammatory macrophage/APC programme contains genes consistent with antigen presentation, inflammatory myeloid activation and complement-associated macrophage identity. Its recurrence across independent bulk decidua cohorts suggests that recurrent pregnancy loss may involve a reproducible decidual myeloid inflammatory tissue state. However, the programme should not be interpreted as proof that macrophages alone cause pregnancy loss. Bulk projection scores can reflect macrophage abundance, macrophage activation state, altered antigen-presentation activity, local inflammatory remodelling, or a combination of these factors.

At the maternal-fetal interface, macrophages participate in tissue remodelling, apoptotic-cell clearance, trophoblast interaction, vascular adaptation, host defence and immune regulation. A shift toward an inflammatory macrophage/APC programme could therefore represent several biological scenarios. It may reflect failure to maintain a tolerogenic or repair-oriented decidual myeloid state, heightened antigen-presentation or inflammatory signalling, response to tissue injury, altered complement-associated macrophage activity, or secondary inflammation after embryonic or placental compromise. These possibilities are not mutually exclusive and cannot be separated using bulk transcriptomic projection alone.

The programme's complement-associated features are also biologically plausible but require cautious interpretation. Complement-related macrophage genes may reflect inflammatory tissue remodelling, immune-complex handling, apoptotic-cell clearance or local innate immune activation. In the present analysis, complement-associated genes contribute to the macrophage/APC tissue-state signature, but the study does not establish complement activation as an independent causal mechanism.

## Value of single-cell-informed transportability analysis

A central challenge in recurrent pregnancy loss transcriptomics is that most public datasets are small and heterogeneous. Standard differential expression analysis can identify candidate genes within a cohort, but such genes may be sensitive to tissue composition, sampling conditions, gestational age, fetal karyotype, platform and preprocessing. This makes it difficult to determine whether a reported signal represents a robust disease-associated tissue state or a dataset-specific observation.

The transportability framework used here addresses this problem by testing compact, interpretable programmes across independent datasets. Instead of asking whether the same individual genes reach statistical significance in every cohort, the analysis asks whether a biologically coherent programme derived from a single-cell reference shifts in the same direction across external bulk cohorts. This is a conservative and useful intermediate level of evidence: stronger than a single-cohort candidate gene list, but still short of experimental validation or clinical biomarker qualification.

The behaviour of the secondary signatures supports this interpretation. The macrophage/APC programme showed the clearest and most consistent directional recurrence, whereas villi- or trophoblast-associated signatures were weaker, neutral or mixed when projected into decidua-focused bulk cohorts. This pattern argues against a trivial result in which every signature shifts similarly across all datasets. Instead, the strongest recurrence was observed for the decidual inflammatory macrophage/APC programme, consistent with tissue-context-aware transportability.

## Relationship to immune-tolerance disruption in recurrent pregnancy loss

The findings are consistent with the broader concept that recurrent pregnancy loss can involve disruption of immune balance at the maternal-fetal interface. Successful early pregnancy requires immune competence without destructive inflammation, tolerance without global immunosuppression and tissue remodelling without uncontrolled injury. Decidual macrophages and antigen-presenting cells are positioned at the centre of this balance because they can participate in both regulatory and inflammatory programmes.

The present analysis does not reduce recurrent pregnancy loss to a single immune mechanism. Instead, it identifies one recurrent tissue-state axis that appears across independent transcriptomic datasets. This axis may coexist with other processes, including abnormal decidualization, trophoblast dysfunction, vascular maladaptation, coagulation or complement dysregulation, chromosomal abnormalities, endocrine contributors and maternal systemic factors. The macrophage/APC programme should therefore be interpreted as one component of a broader decidual failure landscape rather than as a complete explanation for recurrent pregnancy loss.

## Limitations and evidence boundaries

Several limitations are important. First, the external bulk cohorts are small, and statistical testing is underpowered. The primary evidence criterion was therefore directional concordance across cohorts, not formal statistical significance within individual datasets. Second, public metadata were incomplete and not fully harmonized across cohorts. Important variables such as gestational age, fetal karyotype, number of previous losses, clinical subtype, treatment exposure, sampling procedure and tissue composition could not be uniformly controlled.

Third, bulk projection scores do not distinguish changes in cell abundance from changes in cell state. A higher macrophage/APC programme score in case samples may reflect increased macrophage abundance, altered macrophage activation, increased antigen-presentation activity, inflammatory contamination, tissue injury response or a mixture of these processes. Fourth, the single-cell reference itself is limited by its sample composition and by the use of pseudobulk contrasts for exploratory programme derivation. Although pseudobulk summarization avoids treating cells as independent biological replicates, it does not eliminate the limitations of small sample numbers.

Fifth, recurrent pregnancy loss and recurrent spontaneous abortion labels may not represent identical clinical entities across datasets. The analysis harmonized them as case groups for transportability testing, but this simplification may obscure clinically meaningful heterogeneity. Finally, because this is a retrospective computational analysis of public data, the study cannot establish causality, diagnostic performance, therapeutic relevance or patient-level clinical utility.

## Future validation directions

The macrophage/APC programme should be tested in larger decidua cohorts with richer clinical metadata. Future studies should prioritize fetal karyotype information, gestational age matching, standardized tissue sampling, detailed recurrent pregnancy loss phenotype definitions and separation of euploid from aneuploid loss where possible. These features would help determine whether the programme is associated with specific biological subtypes of pregnancy loss.

Spatial and protein-level validation will be particularly important. Spatial transcriptomics, multiplex immunofluorescence, imaging mass cytometry or targeted immunohistochemistry could determine whether the programme localizes to specific decidual niches and whether it reflects macrophage abundance, macrophage activation state, interaction with trophoblasts, stromal remodelling or vascular regions. Single-cell reanalysis of additional disease datasets could also test whether the programme maps to specific macrophage subsets or antigen-presenting cell states.

Functionally, the programme motivates hypotheses about decidual myeloid activation, antigen presentation, complement-associated macrophage biology and inflammatory tissue remodelling. These hypotheses should be investigated experimentally in appropriate decidual cell models, tissue explants or carefully designed maternal-fetal-interface studies. Any future clinical translation would require independent validation, prospective cohort testing and demonstration that the programme adds information beyond established clinical and pathological features.

## Conclusion

This study provides exploratory evidence that a single-cell-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme recurs directionally across three independent bulk decidua transcriptomic cohorts. The finding supports the use of single-cell-informed transportability analysis to identify reproducible tissue-state programmes in recurrent pregnancy loss. The macrophage/APC axis is a biologically coherent and reproducible candidate programme for future validation, but it should not yet be considered causal, diagnostic or clinically actionable.


---
# Figure legends

## Figure 1. Study design and analytical workflow

**Figure 1. Single-cell-informed transcriptomic transportability workflow for recurrent pregnancy loss decidua analysis.**  
The study used GSE214607 as a disease single-cell/pseudobulk reference and three independent bulk decidua cohorts, GSE161969, GSE113790 and GSE178535, as external projection datasets. Single-cell count matrices from GSE214607 were imported, quality-controlled and aggregated into sample-level pseudobulk profiles. Recurrent-miscarriage-associated and tissue-associated candidate programmes were derived from pseudobulk contrasts, filtered for interpretability and converted into compact projection-ready signatures. These signatures were projected into each bulk cohort using within-cohort standardized expression. Transportability was assessed using signature gene coverage, case-minus-control programme-score shifts and directional concordance across cohorts. The workflow was designed to test programme-level recurrence, not diagnostic classifier performance.

## Figure 2. GSE214607-derived projection-ready tissue-state signatures

**Figure 2. Derivation of projection-ready recurrent-miscarriage and tissue-context programmes from GSE214607.**  
Pseudobulk contrasts from the GSE214607 single-cell reference were used to derive candidate recurrent-miscarriage-associated and tissue-associated gene programmes. Candidate genes were filtered to remove low-interpretability noncoding, housekeeping, ribosomal, mitochondrial and technical features while retaining biologically informative maternal-fetal-interface marker genes. Four compact signatures were retained for projection into external bulk cohorts: recurrent-miscarriage decidual inflammatory macrophage/APC up, decidua immune-stromal identity, villi trophoblast/epithelial identity and recurrent-miscarriage villi structural/trophoblast. The macrophage/APC programme was designated as the primary programme of interest because it was disease-associated in the decidual contrast, biologically coherent and technically suitable for projection.

## Figure 3. Three-cohort transportability of the macrophage/APC programme

**Figure 3. A GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme shows positive directional recurrence across three independent bulk decidua cohorts.**  
The compact recurrent-miscarriage decidual inflammatory macrophage/APC programme derived from GSE214607 was projected into GSE161969, GSE113790 and GSE178535. Programme scores are shown for control and RPL/RSA case samples within each cohort. The macrophage/APC programme had complete gene coverage in all three cohorts and showed positive case-associated shifts in every dataset. Case-minus-control deltas were +1.019 in GSE161969, +0.282 in GSE113790 and +0.941 in GSE178535, giving a mean delta of +0.747 and positive recurrence in 3/3 cohorts. Because external cohort sizes were small, this result is interpreted as exploratory directional programme recurrence rather than statistical validation or diagnostic biomarker evidence.

## Figure 4. Cross-cohort delta summary for all projected signatures

**Figure 4. Transportability patterns of four GSE214607-derived signatures across external bulk decidua cohorts.**  
Case-minus-control programme-score deltas are summarized for four GSE214607-derived signatures projected into GSE161969, GSE113790 and GSE178535. The recurrent-miscarriage decidual inflammatory macrophage/APC programme showed the strongest and most consistent positive directional recurrence across cohorts. The decidua immune-stromal identity programme showed weaker positive shifts, while villi trophoblast/epithelial and recurrent-miscarriage villi structural/trophoblast signatures showed weaker, neutral or mixed transportability in decidua-focused bulk datasets. This pattern supports tissue-context-aware transportability and argues against a nonspecific projection effect shared equally across all signatures.

## Supplementary Figure 1. Dataset processing and signature coverage

**Supplementary Figure 1. Dataset processing, quality-control and signature-coverage summary.**  
Summary of public dataset processing steps and signature gene coverage across external bulk cohorts. GSE214607 was processed from raw 10x matrices into pseudobulk sample-level profiles. GSE161969, GSE113790 and GSE178535 were imported from public processed expression matrices and harmonized to gene-symbol-level expression tables. Projection-ready signatures were intersected with each bulk cohort to calculate gene coverage before programme scoring. The primary recurrent-miscarriage decidual inflammatory macrophage/APC signature showed complete 30/30 gene coverage in all three external cohorts.

## Supplementary Figure 2. Single-cohort and intermediate two-cohort projection summaries

**Supplementary Figure 2. Intermediate projection summaries supporting three-cohort transportability analysis.**  
Single-cohort and two-cohort projection summaries illustrate the stepwise development of the transportability analysis. Initial projection into GSE161969 showed a positive shift of the GSE214607-derived macrophage/APC programme. Addition of GSE113790 supported a second positive directional signal, and inclusion of GSE178535 established positive recurrence across three independent cohorts. These intermediate figures are provided for transparency and reproducibility rather than as separate confirmatory analyses.

# Tables

## Table 1. Public datasets used in the analysis

| Dataset | Assay/data type | Tissue/source | Groups used | Role in study | Key processing | Main limitation |
|---|---|---|---|---|---|---|
| GSE214607 | Single-cell RNA-seq / pseudobulk reference | First-trimester decidua and villi | Control and recurrent miscarriage | Disease single-cell reference; programme derivation | Raw 10x matrices imported, QC-filtered, aggregated to sample-level pseudobulk | Limited sample numbers; exploratory programme derivation |
| GSE161969 | Bulk RNA-seq processed expression | Decidua | Control and RPL | External bulk projection cohort | Gene-symbol FPKM matrix; log2(FPKM + 1); within-cohort scoring | Very small cohort; limited metadata |
| GSE113790 | Bulk transcriptomic processed expression | Decidua | Control and RSA | External bulk projection cohort | FPKM matrix imported; sample labels curated; within-cohort scoring | Very small cohort; limited metadata harmonization |
| GSE178535 | Bulk transcriptomic processed expression | Decidua | Control and RSA | External bulk projection cohort | Public normalized log2 matrix used; sample labels curated; within-cohort scoring | Very small cohort; platform/preprocessing differences |

## Table 2. GSE214607-derived projection-ready signatures

| Programme ID | Short label | Source contrast | Number of genes | Biological interpretation | Use in analysis |
|---|---|---|---:|---|---|
| GSE214607_RM_decidua_inflammatory_macrophage_APC_up | RM decidua inflammatory macrophage/APC up | RM decidua vs control decidua | 30 | Antigen-presentation, inflammatory myeloid and complement-associated macrophage/APC tissue-state programme | Primary programme |
| GSE214607_decidua_immune_stromal_identity_up | Decidua immune-stromal identity | Decidua vs villi | 30 | Decidua-enriched immune and stromal tissue-context programme | Secondary comparator |
| GSE214607_villi_trophoblast_epithelial_identity_up | Villi trophoblast/epithelial identity | Villi vs decidua | 30 | Villi/trophoblast/epithelial tissue-context programme | Tissue-context comparator |
| GSE214607_RM_villi_structural_trophoblast_down | RM villi structural/trophoblast programme | RM villi vs control villi | 30 | Villi structural/trophoblast-associated programme | Secondary tissue-context comparator |

## Table 3. Three-cohort transportability summary

| Programme | GSE161969 delta | GSE113790 delta | GSE178535 delta | Positive cohorts | Minimum coverage | Concordance interpretation |
|---|---:|---:|---:|---:|---:|---|
| RM decidua inflammatory macrophage/APC up | +1.019 | +0.282 | +0.941 | 3/3 | 100% | Concordant positive directional signal |
| Decidua immune-stromal identity | +0.573 | +0.206 | +0.031 | 3/3 | 96.7% | Positive but weaker/context-dependent |
| Villi trophoblast/epithelial identity | +0.134 | +0.406 | +0.156 | 3/3 | 100% | Modest positive but tissue-context dependent |
| RM villi structural/trophoblast programme | -0.097 | +0.245 | -0.007 | 1/3 | 96.7% | Mixed/weak; not transportable in decidua cohorts |

## Supplementary Table 1. Full projection-ready signature gene lists

| Programme ID | Genes |
|---|---|
| GSE214607_RM_decidua_inflammatory_macrophage_APC_up | FTL, CD74, FTH1, HLA-DRA, SNX3, FCGRT, HLA-DPA1, HMOX1, S100A9, SNX6, TMEM176B, CYBA, RNASET2, AIF1, HLA-DPB1, MS4A7, NPC2, C1QB, S100A8, ISCU, C1QC, C1QA, CTSZ, PLTP, RAB31, TMSB4X, TMBIM6, YWHAH, SPP1, GRN |
| GSE214607_decidua_immune_stromal_identity_up | GNLY, CST3, CFD, IGFBP2, NKG7, IGFBP7, DCN, PNRC1, LGALS1, IFITM2, EIF1, LUM, JUN, SOD2, ARL6IP4, CCL4, IGFBP1, H3F3B, RBP1, C11orf96, SELENOP, GZMA, IL32, AKAP13, ZFP36L2, JUNB, VCAN, MTDH, IGFBP4, KLF6 |
| GSE214607_villi_trophoblast_epithelial_identity_up | CDKN1C, ANXA1, TFPI, DSP, S100A11, MGST3, EZR, KRT18, ARID3A, KRT19, H19, LY6E, SLC2A1, RALBP1, KRT8, HEBP2, C1QTNF6, ADM, CCT8, CLIC3, FSTL3, DSC2, HBZ, PERP, NUTF2, KRT7, VGLL3, RDX, SPINT2, GALNT1 |
| GSE214607_RM_villi_structural_trophoblast_down | TFPI, CBX3, MT1E, COL4A1, FSTL3, SLC16A3, UBE2S, YWHAE, CDKN1C, COL21A1, RAN, LY6E, EVA1B, GCSH, LAIR2, OBSL1, LRRC59, LRRC32, HEBP2, CGB3, CALR, PCMT1, PIM3, SERPINB9, PROCR, UBE2F, HAPLN3, CCNB1, SLCO4A1, RANBP1 |

## Supplementary Table 2. Cohort-specific projection scores

Full sample-level programme scores are provided in the following repository files:

- `results/projection_scores/GSE161969_GSE214607_projection_scores_annotated.tsv`
- `results/projection_scores/GSE113790_GSE214607_projection_scores_annotated.tsv`
- `results/projection_scores/GSE178535_GSE214607_projection_scores_annotated.tsv`

## Supplementary Table 3. Metadata curation and label harmonization

Curated sample metadata and diagnostic-label harmonization are provided in the following repository files:

- `results/qc/GSE161969_sample_metadata_curated.tsv`
- `results/qc/second_bulk_candidates/GSE113790_sample_metadata_curated.tsv`
- `results/qc/second_bulk_candidates/GSE178535_sample_metadata_curated.tsv`
