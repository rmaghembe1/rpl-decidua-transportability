# Journal targeting and submission strategy v0.1

## Manuscript working title

Single-cell-informed transcriptomic transportability of decidual inflammatory macrophage/APC programmes in recurrent pregnancy loss

## Core positioning

This manuscript should be positioned as a computational reproductive transcriptomics study focused on single-cell-informed programme transportability at the maternal-fetal interface.

The strongest framing is:

> A biologically interpretable recurrent-miscarriage decidual inflammatory macrophage/APC programme derived from a single-cell/pseudobulk reference shows concordant positive directional recurrence across three independent bulk decidua cohorts.

The manuscript should not be framed as:

- generic biomarker discovery;
- a diagnostic classifier study;
- causal proof of macrophage-mediated recurrent pregnancy loss;
- a broad recurrent pregnancy loss pathogenesis model;
- a single-gene candidate-marker paper.

## Best-fit article category

Original research article, computational biology / reproductive immunology / maternal-fetal-interface transcriptomics.

Possible article-type labels depending on journal:

- Original Research
- Research Article
- Computational Biology
- Translational Bioinformatics
- Reproductive Immunology
- Systems Biology / Omics

## Recommended journal-fit priorities

### Priority 1: Reproductive biology / pregnancy-loss / placenta journals

These journals are likely to understand the maternal-fetal-interface framing and the biological importance of decidual immune-state programmes.

Best framing for this group:

- recurrent pregnancy loss decidua;
- maternal-fetal-interface immune programme recurrence;
- decidual macrophage/APC inflammatory tissue state;
- single-cell-informed reanalysis of public datasets.

Strengths:

- strong biological fit;
- likely reviewer familiarity with decidua, trophoblast, RPL/RSA terminology;
- manageable expectation for exploratory public-data studies.

Risks:

- reviewers may request experimental validation;
- may expect more clinical metadata than public datasets provide;
- need very clear evidence boundaries.

### Priority 2: Computational biology / transcriptomics / systems medicine journals

These journals may value the transportability framework and reproducible GitHub release.

Best framing for this group:

- single-cell-informed programme projection;
- cross-cohort transcriptomic transportability;
- public-data reproducibility;
- interpretable tissue-state programme recurrence.

Strengths:

- methodological novelty stronger;
- GitHub release and QC reports are major positives;
- less emphasis on immediate clinical translation.

Risks:

- reviewers may want more formal benchmarking;
- may ask for comparison with DEG-only or classifier approaches;
- may require stronger software/package reproducibility details.

### Priority 3: Open-access general biomedical journals with reproductive/transcriptomic scope

These may be realistic if the manuscript is framed cautiously and the repository is polished.

Best framing for this group:

- reproducible public-data reanalysis;
- biologically interpretable result;
- three independent cohort recurrence;
- clear limitations and future validation plan.

Strengths:

- broader scope;
- often receptive to computational reanalysis if transparent.

Risks:

- APC cost may be a barrier;
- novelty may be judged as moderate unless the transportability framework is emphasized.

## Journals to approach cautiously

Avoid submitting first to journals that require one of the following unless additional validation is added:

- strong experimental validation;
- prospective clinical cohort validation;
- diagnostic performance metrics;
- mechanistic causal evidence;
- large multi-centre clinical sample sizes.

The manuscript should also avoid high-impact broad biomedical journals at the first pass unless strengthened with spatial validation, independent single-cell disease replication, or experimental immunology.

## Recommended first-submission framing

Recommended title style:

**Single-cell-informed transcriptomic transportability of decidual inflammatory macrophage/APC programmes in recurrent pregnancy loss**

Recommended abstract emphasis:

1. RPL bulk transcriptomic studies are difficult to compare.
2. Single-cell references enable interpretable tissue-state programme derivation.
3. GSE214607-derived macrophage/APC programme was projected into three external bulk decidua cohorts.
4. The macrophage/APC programme showed complete coverage and positive recurrence in 3/3 cohorts.
5. The result is exploratory programme transportability, not biomarker validation.

## Recommended reviewer-facing claim boundary

Use this wording consistently:

> These results support exploratory programme-level transportability of a decidual inflammatory macrophage/APC tissue-state axis in recurrent pregnancy loss, but do not establish causality, diagnostic performance, or clinical utility.

Avoid wording such as:

- “validated biomarker”
- “diagnostic signature”
- “causal macrophage mechanism”
- “predicts recurrent pregnancy loss”
- “confirms macrophages cause RPL”
- “clinically actionable marker”

## Suggested target-journal decision criteria

Before selecting the first journal, check:

1. Does the journal accept computational reanalysis of public transcriptomic datasets?
2. Does it publish reproductive immunology, pregnancy loss, decidua or placenta omics?
3. Does it permit GitHub/code-based reproducibility packages?
4. Is an APC waiver, no-fee route or institutional route available?
5. Are article-length and figure/table limits compatible with the manuscript?
6. Does the journal require validation experiments for omics-only papers?
7. Does it accept exploratory language and public-data limitations?

## Pre-submission strengthening tasks

High priority:

- Add formal references and in-text citations.
- Add software and package version details.
- Add a final dataset table with sample numbers and tissue labels.
- Confirm figure resolution and journal-ready formatting.
- Archive GitHub repository to Zenodo/OSF/Figshare if a DOI is desired.
- Add a clear Data and Code Availability statement to the final manuscript.
- Add title page, author details, affiliation and correspondence email.

Medium priority:

- Add supplementary tables for full projection scores and curated metadata.
- Add a schematic workflow figure if feasible.
- Add a short comparison paragraph explaining why this is not another DEG/biomarker paper.
- Add a limitations paragraph specifically addressing fetal karyotype and gestational-age heterogeneity.

Optional strengthening:

- Add one more independent decidua bulk cohort if feasible.
- Add independent single-cell disease sensitivity analysis using GSE164449 or GSE169269 if time permits.
- Add simple robustness analysis using alternative scoring or leave-one-gene-out scoring for the macrophage/APC programme.

## Recommended submission sequence

1. Finalize manuscript v0.4 with references, declarations and figure/table callouts.
2. Decide journal target after APC/no-fee assessment.
3. Adapt title page, word count, abstract structure and references to journal format.
4. Archive repository if DOI is needed.
5. Prepare cover letter emphasizing reproducibility and evidence boundaries.
6. Submit as computational original research / reproductive transcriptomics study.

## One-paragraph editor pitch

This manuscript presents a reproducible public-data reanalysis using single-cell-informed programme transportability to address recurrent pregnancy loss transcriptomics. Instead of proposing a diagnostic classifier or dataset-specific DEG list, the study derives compact recurrent-miscarriage tissue-state programmes from the GSE214607 single-cell/pseudobulk reference and projects them into three independent bulk decidua cohorts. The main finding is a recurrent-miscarriage decidual inflammatory macrophage/APC programme with complete gene coverage and positive directional recurrence across GSE161969, GSE113790 and GSE178535. The work is fully code-supported and explicitly framed as exploratory programme-level transportability rather than causal or diagnostic validation.
