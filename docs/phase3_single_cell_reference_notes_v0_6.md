# Phase 3 single-cell reference implementation notes v0.6

## Objective

Build the single-cell-derived programme layer that will later be projected into independent bulk decidua/MFI datasets.

## Locked interpretation

- Primary novelty: transportability of decidual/MFI tissue-state programmes.
- Not a diagnostic biomarker discovery workflow.
- Not a causal test of RPL mechanisms.
- Cell-type programmes are evidence-graded and projected across datasets.

## Priority datasets

1. GSE214607: disease single-cell decidua/villi reference.
2. GSE164449: unexplained RPL CD45+ decidual immune reference.
3. E-MTAB-6701: normal first-trimester MFI reference.
4. GSE169269: macrophage-specific sensitivity reference.

## Minimum acceptance criteria before signature derivation

- Sample-level metadata recovered for condition and tissue source.
- Broad cell-type annotations recoverable or reproducible by marker QC.
- At least donor/sample-aware pseudobulk profiles possible.
- Disease contrasts avoid cell-level pseudoreplication.
- Fine subsets are not overinterpreted if sample numbers are small.

## Main outputs

- Harmonized single-cell metadata.
- Broad compartment annotation QC.
- Pseudobulk profiles by sample x cell type.
- Evidence-graded cell identity, disease-shift and functional programme signatures.
