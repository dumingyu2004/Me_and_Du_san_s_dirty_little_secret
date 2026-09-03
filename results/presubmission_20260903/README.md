# Pre-submission experiment results — 2026-09-03

Code revision tested: `e3920476c4ab13c2962c7a27372e1c0d687f7ab9`

This delivery contains the four experiments requested in the 2026-09-03
pre-submission queue, together with the official summary, logs, verification
report, and a compact downloadable archive.

## Completion status

| Experiment | Status | Main result |
|---|---:|---|
| Nine-depth BH-FDR + pooled bootstrap | Complete | 8/9 depths survive BH-FDR; only depth 0% is not significant (`q=0.528`) |
| Pairwise contact probes (raw vs SAE) | Complete | Positive control AUROC `0.6443`; every raw checkpoint outperforms its SAE counterpart |
| Native fold-disjoint evaluation | Complete | 18/18 requested model/layer cells produced |
| 25-permutation headline null | Complete | Maximum change from 5 permutations `0.00023`; median `0.00007` across 18 cells |

The first BH attempt correctly stopped because native activation files were
absent at several non-headline depths. The missing 12 model/layer cells were rebuilt,
after which the same BH command completed successfully. See
`new_requirements_20260903.log` and `rebuild_and_bh_20260903.log`.

## Main numerical results

### Nine-depth multiplicity correction

- BH-FDR (`alpha=0.05`): **8/9 depths significant**.
- Full-depth omnibus mean effect: **d = +0.2413**, 95% CI
  **[+0.1927, +0.2913]**, bootstrap positive fraction `1.000`.
- Validation omnibus mean effect: **d = +0.1587**, 95% CI
  **[+0.1108, +0.2069]**, bootstrap positive fraction `1.000`.

Source: `logs_tier1/s5_bh_20260903_114207.log` and the three files under
`outputs_robustness/`.

### Pairwise contact probes

- ESM-2 positive-control raw AUROC: **0.6443**; shuffled-label control:
  `0.4884`, demonstrating that the probe has power.
- Controlled CLM raw AUROC range: **0.6039–0.6148**; SAE range:
  **0.5733–0.5828**.
- Controlled MLM raw AUROC range: **0.5928–0.6313**; SAE range:
  **0.5563–0.5958**.
- Shuffled-label controls remain approximately chance (`0.4901–0.5097`).

Interpretation: pairwise contact information is present in the raw
representations, while the evaluated SAE representation consistently weakens
it. Source: `results_pairwise_probe/*.json` and
`reviewer_batch_summary_20260903.txt`.

### Fold-disjoint control

The new split holds out 151 domains and has **0/151 fold overlap** with the
fit set, compared with 118/150 overlapping domains in the old random split.
All 18 requested native cells completed. Source:
`outputs_ctrl_folddisj/` and `logs_checks/check3_20260903_075004.log`.

### Permutation-count stability

Increasing the headline null from 5 to 25 permutations changed the reported
values by at most **0.00023** and by a median of **0.00007** over 18 cells.
The original headline values are therefore stable to this increase in null
sampling. Source: `results_nshuffle_headline/nshuf25/` and
`logs_checks/check2_20260903_075008.log`.

## Verification

- `tests/run_all.sh`: **all suites passed**.
- `preflight.sh all`: **12 passed, 0 failed, 3 skipped**.
- Official paper-claim verifier over the complete delivery set:
  **22 pass, 2 changed, 0 missing, 6 new**; archive consistency checks report
  zero clashes.

The two `CHANGED` entries are not execution failures. They flag that the new
block-18 probe results (linear `3/9`, MLP `2/9`) do not reproduce the paper's
older `27/27` statement from blocks 7/11/14. This discrepancy must be reflected
in the manuscript rather than hidden.

See `final_preflight_20260903.txt` and `verify_paper_claims_20260903.txt`.

## Files

- `presubmission_compact_20260903.tgz`: compact archive of the delivered
  machine-readable results and logs.
- `presubmission_manifest_20260903.txt`: exact archive member list.
- `SHA256SUMS`: archive checksum.
- `reviewer_batch_summary_20260903.txt`: output of the repository's official
  summary script.
