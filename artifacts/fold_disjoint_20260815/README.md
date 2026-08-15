# Fold-disjoint result artifact (2026-08-15)

This directory contains the compact, reviewable record of the two experiment versions:

- [Current/leakage-sensitive report](../../reports/FOLD_DISJOINT_CURRENT.md)
- [Formal fold-disjoint report](../../reports/FOLD_DISJOINT_FORMAL.md)
- [Machine-readable summary](RESULTS.json)

## Provenance

- Host: Ronnie
- Source checkout commit: `6d2e5c0714c1a55eee3e87a6605f7e148cf6d891`
- Formal split: `split_level=fold`, `split_seed=42`
- Formal run: 18/18 arm-layer cells
- Fold audit: 0/151 held-out items share a SCOPe fold with the fit set

## Scope

The GitHub commit intentionally contains reports and compact text/JSON summaries. The Ronnie worktree also contains large `.npy`, `.pt`, checkpoint, and activation artifacts; those are not copied here because they are multi-gigabyte run products and are not needed to review the conclusion. They remain available on Ronnie for re-analysis.

The formal conclusion is deliberately conservative: the corrected split removes the 78.7% fold leakage and leaves the structural signal essentially unchanged; local Concept-F1 does not robustly beat the prevalence floor; the strict global probe remains above the shuffled-label control.
