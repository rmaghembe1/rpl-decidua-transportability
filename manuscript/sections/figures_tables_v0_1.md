# Figure legends and table shells v0.1

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

# Table shells

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

Placeholder for full sample-level programme scores exported from:

- `results/projection_scores/GSE161969_GSE214607_projection_scores_annotated.tsv`
- `results/projection_scores/GSE113790_GSE214607_projection_scores_annotated.tsv`
- `results/projection_scores/GSE178535_GSE214607_projection_scores_annotated.tsv`

## Supplementary Table 3. Metadata curation and label harmonization

Placeholder for curated sample metadata and diagnostic-label harmonization exported from:

- `results/qc/GSE161969_sample_metadata_curated.tsv`
- `results/qc/second_bulk_candidates/GSE113790_sample_metadata_curated.tsv`
- `results/qc/second_bulk_candidates/GSE178535_sample_metadata_curated.tsv`
