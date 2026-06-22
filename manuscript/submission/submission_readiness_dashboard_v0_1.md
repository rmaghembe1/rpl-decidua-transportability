# Submission-readiness dashboard v0.1

## Manuscript

Single-cell-informed transcriptomic transportability of decidual inflammatory macrophage/APC programmes in recurrent pregnancy loss

## Current preferred manuscript draft

`manuscript/manuscript_full_draft_v0_7.md`

## Current repository status

The repository contains a reproducible computational manuscript package, including analysis outputs, figure files, manuscript drafts, citation-planning files, submission statements, QC reports and release documentation.

## Core result

A GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme shows concordant positive directional recurrence across three independent bulk decidua cohorts:

| Cohort | Direction | Delta |
|---|---:|---:|
| GSE161969 | Positive | +1.019 |
| GSE113790 | Positive | +0.282 |
| GSE178535 | Positive | +0.941 |

Summary:

- Positive recurrence in 3/3 external bulk decidua cohorts.
- Complete 30/30 macrophage/APC signature gene coverage in all three cohorts.
- Mean cross-cohort delta: +0.747.
- Strongest manuscript framing: exploratory programme-level transportability.

## What is complete

| Area | Status |
|---|---|
| Three-cohort transportability analysis | Complete |
| Projection-ready GSE214607 signatures | Complete |
| Primary macrophage/APC result summary | Complete |
| Main figures exported as PNG and SVG | Complete |
| Release manifest | Complete |
| Reproducibility index | Complete |
| GitHub repository initialization | Complete |
| Manuscript scaffold | Complete |
| Abstract and Introduction draft | Complete |
| Methods draft | Complete |
| Results draft | Complete |
| Discussion draft | Complete |
| Figure legends and table shells | Complete |
| Full manuscript draft v0.3 | Complete |
| Cleaned citation-mapping draft v0.7 | Complete |
| Submission statements | Complete draft |
| Title page | Complete draft |
| Submission package index | Complete |
| Journal-targeting strategy | Complete |
| Reference plan | Complete |
| Verified reference seed table | Complete |
| Formal citation metadata table | Complete first pass |
| Citation-placement QC | Complete |

## What remains before journal submission

| Task | Priority | Notes |
|---|---|---|
| Select target journal | High | Needed before final formatting and reference style conversion |
| Convert `[REF:source_key]` placeholders to journal-formatted citations | High | Use `formal_citation_metadata_v0_1.tsv` |
| Complete partial reference metadata | High | Especially optional/contextual entries |
| Finalize corresponding author email | High | Placeholder remains in title page |
| Remove citation-map notes from final submission manuscript | High | Keep citation-map draft in repo, but remove maps from final clean manuscript |
| Convert table shells into final main/supplementary tables | High | Use result TSVs and manuscript table shells |
| Confirm figure format and resolution requirements | High | Depends on target journal |
| Add repository DOI if archiving on Zenodo/OSF/Figshare | Medium | Optional but recommended |
| Add final software/package version statement | Medium | Strengthens reproducibility |
| Prepare cover letter | Medium | Should emphasize programme transportability and evidence boundaries |
| Perform final claim-boundary QC | High | Prevent overclaiming biomarker, causality or clinical utility |

## Claims that are supported

The manuscript can support the following claims:

1. A compact recurrent-miscarriage decidual inflammatory macrophage/APC programme was derived from the GSE214607 single-cell/pseudobulk reference.
2. This programme showed complete gene coverage in three independent bulk decidua projection cohorts.
3. This programme showed positive case-minus-control score shifts in GSE161969, GSE113790 and GSE178535.
4. The cross-cohort pattern supports exploratory programme-level transportability.
5. The findings motivate further validation using independent single-cell, spatial, prospective and mechanistic studies.

## Claims that should not be made

The manuscript should not claim:

1. The macrophage/APC programme is a validated diagnostic biomarker.
2. The programme predicts recurrent pregnancy loss in clinical practice.
3. Macrophages or APCs are proven causal drivers of recurrent pregnancy loss.
4. The signature has established clinical utility.
5. The result generalizes across all RPL subtypes, gestational ages or clinical contexts.
6. The programme replaces clinical evaluation or existing diagnostic workflows.
7. The three bulk cohorts constitute prospective validation.

## Preferred wording for the main claim

Use:

> These results support exploratory programme-level transportability of a GSE214607-derived recurrent-miscarriage decidual inflammatory macrophage/APC programme across three independent bulk decidua cohorts.

Avoid:

> We validated a diagnostic recurrent pregnancy loss biomarker.

## Preferred evidence-boundary wording

Use:

> This study does not establish causality, diagnostic performance, clinical utility or standalone biomarker validation.

## Recommended next milestone

Create a clean final-preparation manuscript draft, provisionally:

`manuscript/manuscript_full_draft_v0_8_final_preparation.md`

This version should:

- retain the scientific content of v0.7;
- preserve reference placeholders until target journal is selected;
- remove internal citation-map notes from the manuscript body;
- keep citation maps and QC reports as repository documentation;
- prepare the manuscript for final citation conversion and journal formatting.

## Current decision point

The project is ready for one of two paths:

1. **Journal-selection path**: choose target journal, then convert citations and formatting.
2. **Clean-manuscript path**: create v0.8 final-preparation draft without internal citation-map notes, then choose journal.

Recommended next path:
Clean-manuscript path first, then journal selection.
