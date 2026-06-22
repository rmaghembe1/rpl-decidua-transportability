# Scientific Reports manuscript-template adoption note v0.1

## Purpose

This note documents the decision to use the previously submitted NOA transcriptomics manuscript format as the structural template for the RPL decidua transportability manuscript.

## Rationale

The NOA transcriptomics manuscript has passed Scientific Reports technical checks and is currently under editorial handling. Therefore, its structure, section order, title-page organization, reference style and supporting-information layout provide a practical template for this RPL manuscript package.

## Template source

Template manuscript:

`NOA_transcriptomics_manuscript_v20.docx`

Working title of template manuscript:

Single-cell-informed transcriptomics reveals transportable germ-cell depletion and inflammatory niche remodelling in human non-obstructive azoospermia

## Template elements to reuse

The RPL manuscript should follow this general structure:

1. Full title
2. Short title
3. Article type
4. Author name and numbered affiliations
5. Corresponding author block
6. Email addresses
7. Abstract
8. Introduction
9. Materials and Methods
10. Ethics statement
11. Study design and analytical overview
12. Dataset identification and metadata curation
13. Dataset-specific processing subsections
14. Signature derivation/projection subsections
15. Statistical/transportability analysis subsections
16. Software and reproducibility
17. Results
18. Figure captions integrated near relevant result sections or placed after results depending on journal formatting
19. Main table(s)
20. Discussion
21. Conclusion
22. Data Availability Statement
23. Author contributions
24. Funding
25. Acknowledgments
26. Competing interests
27. References
28. Supporting information captions

## RPL-specific adaptation

The RPL manuscript should adapt the template without changing its central scientific framing.

Template concept in NOA:

Single-cell-informed transcriptomic transportability of tissue-state programmes across public single-cell and bulk reproductive datasets.

RPL manuscript concept:

Single-cell-informed transcriptomic transportability of decidual inflammatory macrophage/APC programmes across public recurrent pregnancy loss decidua datasets.

## RPL title-page adaptation

Recommended title:

Single-cell-informed transcriptomic transportability of decidual inflammatory macrophage/APC programmes in recurrent pregnancy loss

Recommended short title:

Decidual macrophage/APC programme transportability in recurrent pregnancy loss

Recommended article type:

Research Article

Recommended author block:

Reuben S. Maghembe1,2*

1Department of Microbiology and Parasitology, Faculty of Medicine, St. Francis University College of Health and Allied Sciences, Ifakara, Tanzania

2Department of Omics and Computational Biology, AfroBiomics Co. Ltd., Bridge Street, Samora Tower, Kivukoni, Dar es Salaam, Tanzania

*Corresponding author: Reuben S. Maghembe

Email: rmaghembe@gmail.com; rmaghembe@sfuchas.ac.tz

## RPL methods adaptation

The NOA template methods structure should be adapted as follows:

| NOA template section | RPL manuscript equivalent |
|---|---|
| Ethics statement | Public de-identified dataset ethics statement |
| Study design and analytical overview | Single-cell-informed decidual programme transportability design |
| Dataset identification and metadata curation | GSE214607, GSE161969, GSE113790 and GSE178535 curation |
| Single-cell reference construction | GSE214607 decidua/villi pseudobulk and signature derivation |
| Cell-type annotation and signature derivation | Decidual macrophage/APC and tissue-state programme construction |
| Bulk RNA-seq/microarray projection | Projection into three independent bulk decidua cohorts |
| Cross-dataset transportability analysis | Three-cohort directional concordance and delta summary |
| Software and reproducibility | R/Unix/GitHub reproducibility statement |

## RPL results adaptation

The RPL Results section should mirror the NOA logic:

1. Dataset assembly and analysis design.
2. GSE214607-derived programme construction.
3. Identification of the RM decidual inflammatory macrophage/APC programme.
4. Complete gene coverage across three external cohorts.
5. Concordant positive programme recurrence across GSE161969, GSE113790 and GSE178535.
6. Secondary tissue-state signatures and context-dependent findings.
7. Cross-cohort synthesis and claim-boundary summary.

## RPL discussion adaptation

The RPL Discussion should mirror the NOA style:

1. Principal finding.
2. Biological interpretation of the macrophage/APC programme.
3. Value of single-cell-informed transportability analysis.
4. Relationship to decidual immune dysregulation and maternal-fetal-interface biology.
5. Limitations and evidence boundaries.
6. Future validation directions.
7. Conclusion.

## Important claim boundary

The RPL manuscript must preserve the following boundary:

The study supports exploratory programme-level transportability. It does not establish causality, diagnostic performance, clinical utility or standalone biomarker validation.

## Next manuscript production step

Create a Scientific Reports-style RPL manuscript draft:

`manuscript/manuscript_full_draft_v0_9_scientific_reports_style.md`

This version should use the Scientific Reports-tested NOA manuscript structure and adapt the current RPL v0.8 content into that format.
