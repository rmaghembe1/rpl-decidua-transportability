# Git ignore policy for three-cohort transportability release

This repository is intended to include scripts, compact derived signatures, curated metadata, result summaries, figures and reproducibility documentation.

Large public raw data, large single-cell intermediate objects and regenerable expression matrices are excluded from GitHub by default.

## Included

- Scripts needed to audit, import, project and summarise the three bulk cohorts.
- Compact GSE214607 projection-ready signatures.
- Curated sample metadata for GSE161969, GSE113790 and GSE178535.
- Signature coverage tables.
- Three-cohort transportability and concordance summaries.
- Main and supporting figures in PNG and SVG.
- Milestone notes, release manifest and reproducibility index.

## Excluded or regenerated

- GSE214607 raw tar archive.
- Large GSE214607 processed single-cell sparse objects.
- GEO-downloaded compressed expression matrices.
- Regenerable normalised expression matrices.
- Verbose run logs.

These excluded files can be regenerated from public GEO inputs using the included scripts or archived separately on Zenodo/OSF if a frozen data snapshot is required.
