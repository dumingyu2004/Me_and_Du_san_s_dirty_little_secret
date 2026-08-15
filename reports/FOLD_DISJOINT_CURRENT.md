# Current version: leakage-sensitive split

Run date: 2026-08-15 (Sydney), on Ronnie. The audit was report-only; it did not start GPU re-training.

## What this version measures

The historical/current evaluation uses the legacy random split. It is retained for continuity, but it is not an independent final-performance claim because the held-out set overlaps the training set at the SCOPe-fold level.

- Held-out fold leakage: **118 / 150 = 78.7%**
- Fold-disjoint audit result: **0 / 151 = 0%** (see the formal report)
- Source code used on Ronnie: commit `6d2e5c0714c1a55eee3e87a6605f7e148cf6d891` in the upstream experiment checkout.

## Historical metrics retained for comparison

These numbers are useful as a before/after reference only:

| Quantity | Legacy/random split |
|---|---:|
| Structural `struct_delta` mean | 0.00947390 |
| Structural `struct_delta` median | 0.00624817 |
| Positive `struct_delta` fraction | 0.588737 |
| Trivial-baseline test F1 | 0.3631 |
| Global-probe AUROC | 0.7821 |
| Global-probe AP | 0.8675 |
| Shuffled-label AUROC control | 0.5012 |

## Interpretation

The legacy version is leakage-sensitive and should not be quoted as the paper's formal independent performance. It remains useful as a historical/current baseline against which the corrected split can be compared.

Additional limitations observed in the run:

- The Stage-1 comparability gate failed: causal vs masked dictionaries differed by about 1.30x in live features and 1.71x in L0, so cross-arm comparisons are confounded.
- The raw-vs-SAE global contrast was not available because `outputs_raw_real/.../X.npy` was absent.
- The 500-token-per-protein Job 4 remained on hold.

See [FOLD_DISJOINT_FORMAL.md](FOLD_DISJOINT_FORMAL.md) for the strict, leakage-free conclusion.
