# Next bulk dataset expansion plan

## Current completed anchor

GSE214607 single-cell/pseudobulk recurrent-miscarriage programmes have been derived and projected into GSE161969 bulk decidua.

The strongest pilot signal is:

- Signature: GSE214607_RM_decidua_inflammatory_macrophage_APC_up
- Target cohort: GSE161969 bulk decidua
- Coverage: 30/30 genes
- Delta mean RPL minus control: +1.019
- Wilcoxon p-value: 0.114
- BH FDR: 0.457
- Interpretation: positive directional transportability signal, exploratory only

## Rationale for next step

GSE161969 is useful as a pilot proof-of-concept but is underpowered, with n=3 controls and n=4 RPL. The next analysis should test whether the macrophage/APC programme shows consistent direction in a second independent bulk decidua/RPL or RSA cohort.

## Priority for next cohort

Priority should be given to a bulk dataset with:

1. Decidua or maternal-fetal-interface tissue rather than peripheral blood.
2. RPL/RM/RSA case-control design.
3. Clear sample-level metadata.
4. Processed expression matrix available from GEO or ArrayExpress.
5. Enough samples to improve beyond the GSE161969 pilot.

## Analysis objective

Project the four GSE214607-derived programme signatures into the second bulk cohort and evaluate directional consistency, especially for:

GSE214607_RM_decidua_inflammatory_macrophage_APC_up

## Interpretation boundary

A second concordant dataset would support programme transportability. It should still be framed as transcriptomic programme recurrence, not causal proof and not standalone diagnostic biomarker validation.
