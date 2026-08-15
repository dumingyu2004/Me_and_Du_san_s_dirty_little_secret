# Formal version: strict fold-disjoint performance

Run date: 2026-08-15 (Sydney), on Ronnie. This is the corrected conclusion intended for formal reporting.

## Split and run status

- Held-out SCOPe-fold leakage: **0 / 151 = 0%**.
- Refitted/evaluated **18 / 18** arm-layer cells.
- No pLM re-training was started; the fold-disjoint refit was the requested SAE/evaluation stage.
- Structural refit command: `FOLDDISJ_APPLY=1 ONLY=3 bash run_checks.sh`.
- Concept-F1, floor baseline, and global-probe reads used the fold-level evaluation.

## Structural result

| Arm | Layer | Mean `struct_delta` |
|---|---:|---:|
| MLM | 11 | 0.01871487 |
| MLM | 14 | 0.01670271 |
| MLM | 18 | 0.01418924 |
| CLM | 11 | 0.00166879 |
| CLM | 14 | 0.00147276 |
| CLM | 18 | 0.00417001 |

Across all 18 cells, the formal mean was **0.00948640**, median **0.00624025**, and the positive fraction was **0.590430**. These are effectively unchanged from the legacy reference (mean 0.00947390; median 0.00624817; positive fraction 0.588737).

## Concept-F1

| Arm | Layer | Test F1 mean | Test F1 SD | Concepts > 0.5 (mean) | Aligned features (mean) |
|---|---:|---:|---:|---:|---:|
| MLM | 11 | 0.472562 | 0.013333 | 5.33 | 2086.3 |
| MLM | 14 | 0.452057 | 0.019914 | 4.33 | 2174.7 |
| MLM | 18 | 0.445692 | 0.003775 | 4.33 | 2332.0 |
| CLM | 11 | 0.411589 | 0.007147 | 3.33 | 2537.7 |
| CLM | 14 | 0.397685 | 0.007808 | 2.67 | 2484.7 |
| CLM | 18 | 0.373608 | 0.006481 | 2.00 | 2365.7 |
| **Overall** | — | **0.425532** | **0.035894** | **3.67** | — |

## Trivial/prevalence floor

| Arm | Layer | Test F1 | Margin over floor | Labels beaten (of 3) |
|---|---:|---:|---:|---:|
| MLM | 11 | 0.4236 | -0.0755 | 0.67 |
| MLM | 14 | 0.4150 | -0.0842 | 1.00 |
| MLM | 18 | 0.4107 | -0.0884 | 0.33 |
| CLM | 11 | 0.3441 | -0.1550 | 0.00 |
| CLM | 14 | 0.3164 | -0.1828 | 0.00 |
| CLM | 18 | 0.2756 | -0.2235 | 0.00 |
| **Overall** | — | **0.3643** | **-0.1349** | **0.33** |

The corrected Concept-F1 does **not** robustly beat the prevalence floor.

## Strict global probe

| Arm | Layer | AUROC mean | AUROC SD | AP mean | Shuffled control |
|---|---:|---:|---:|---:|---:|
| MLM | 11 | 0.7030 | 0.0666 | 0.8362 | 0.5166 |
| MLM | 14 | 0.7214 | 0.1128 | 0.8274 | 0.4966 |
| MLM | 18 | 0.7294 | 0.0603 | 0.8415 | 0.4920 |
| CLM | 11 | 0.8154 | 0.0412 | 0.8847 | 0.4978 |
| CLM | 14 | 0.8794 | 0.0291 | 0.9204 | 0.4968 |
| CLM | 18 | 0.8638 | 0.0116 | 0.9131 | 0.4973 |
| **Overall** | — | **0.7854** | **0.0943** | **0.8706** | **0.4995** |

The global remote-homology signal remains above the shuffled-label control. The corrected overall AUROC is essentially unchanged from the legacy reference (0.7821).

## Formal conclusion

The corrected split removes the 78.7% fold leakage and leaves the structural signal essentially unchanged. The local Concept-F1 result is not a robust win over the prevalence floor, while the strict global probe still shows above-random remote-homology signal. Therefore the formal claim should be limited to those statements; the legacy/random-split numbers should be labeled historical and leakage-sensitive.

Known caveats: Stage-1 cross-arm comparability failed (causal vs masked dictionaries differed by about 1.30x in live features and 1.71x in L0); raw-vs-SAE comparison was unavailable because `outputs_raw_real/.../X.npy` was missing; Job 4 remained on hold.
