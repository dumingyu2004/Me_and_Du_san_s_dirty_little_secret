# Appendix follow-up delivery — 2026-09-09

All new compute used repository commit `643c48ae70a6b244ac114166a147a06e73d20f50` on Ronnie.

## 1. SAE-free probes at blocks 7, 11, and 14

The requested six arms (seeds 42/43/44 × masked/causal) were run for both the linear and MLP variants. The result directories and a combined archive are included in this directory.

## 2. Fold-disjoint shuffled tree from 2026-08-28

- `folddisj_shuf_compact_20260828.tgz` contains the complete analysis-facing tree (324 files: CSV, JSON, PNG, and auxiliary NumPy outputs).
- To stay below GitHub's per-file limit, it excludes the 18 `Z.npy` activation matrices and 18 `sae_model.pt` checkpoints.
- A full archive including those large files was preserved separately as `folddisj_shuf_full_20260828.tar.gz` (5,315,102,926 bytes), SHA-256 `397ac3ade10c4e10a0606ffff887a1ef1c4753d82f78399c6bd65b40fa285260`.

## 3. Block-shuffle depth extension

`DEPTHS="0 4 7 22 26 29" ONLY=3 bash RUN_BLOCKSHUFFLE.sh` completed successfully: 36/36 requested new cells (six depths × six arms), with no retraining. Together with the earlier blocks 11/14/18, `outputs_ctrl_blk16` now has all 54 cells on the nine-depth grid.

- Browsable files: `blockshuffle_blk16_20260909/`
- Original self-contained archive: `blockshuffle_blk16_20260909.tgz`
- Three-seed depth summary: `blockshuffle_depth_summary.csv`

The shallow L0 SAEs and two L4 masked SAEs were flagged as near-degenerate by the existing EV diagnostic, so those rows should not be over-interpreted without that caveat.

## 4. Provenance of `top1_agreement_shuf.csv`

It is a **shuffled-tree** result, not native. The exact producer used:

```text
experiment_aa_selectivity.py --root outputs_ctrl_shuf \
  --cells ckpt_mlm_s42_token:14,ckpt_clm_s42:14 \
  --out results_rigor/aa_selectivity_shuf.csv
```

`analyze_top1_agreement.py` then consumed that file and wrote `top1_agreement_shuf.csv`. The native attempt failed because `results_rigor/aa_selectivity.csv` did not exist. Therefore `−0.044` masked and `−0.122` causal must not be described as native. Yes: block 14, seed 42, and the two masked/causal rows are all that were run for this analysis.

Evidence is under `logs/` and `results_rigor/`.

## 5. Trace of the three unlocated paper numbers

### “Co-activation rho passes, 18/18 cells”

This came from `experiment_extra_metrics.py` and the 36 native/shuffled `geometry_summary.json` files under `results_extra_geometry/`. Recalculation confirms shuffled rho is below native rho in all 18 paired cells (masked 9/9; causal 9/9). The convenient joined table is `coactivation_rho_18cell_comparison.csv`.

### “4 of 12 concepts”

This is traceable to `results_synthetic_nomodel/concept_f1/summary.json` and `concept_f1.csv`: four concepts had test F1 above 0.5. It came from the **local no-model/synthetic Concept-F1 baseline**, not the genuine released InterPLM attack grid. The paper should label that pipeline explicitly rather than present it as an InterPLM-grid result.

### Selectivity vs `L_seq`, −0.676 and −0.412

These are exactly the `rho_selectivity_seq` values in `results_rigor/aa_selectivity_shuf.csv`: masked `−0.6763864519`, causal `−0.4124657907`. They are from the **shuffled tree**, at block 14, seed 42 only.

## 6. InterPLM attack-pipeline extras

For the InterPLM attack grid itself, no delivered or on-box evidence was found for:

- single-latent F1;
- decoder-geometry rho;
- SAEBench per-cell values.

Those rows should be marked **not delivered**. All three metrics were computed separately for the ordinary project-SAE grid, but those are different SAEs and a different protocol and cannot be represented as InterPLM attack-grid values.
