# Appendix provenance (2026-09-09)

- `top1_agreement_shuf.csv` was produced from `outputs_ctrl_shuf`, specifically block 14 / seed 42 / masked+causal only. The values -0.044 and -0.122 are shuffled-tree, not native-tree results.
- The exact selectivity-vs-L_seq values -0.6763864519 (masked) and -0.4124657907 (causal) are in `results_rigor/aa_selectivity_shuf.csv`; they are also shuffled-tree values.
- The co-activation-rho 18/18 result comes from the 18 native-vs-shuffled cell pairs in `results_extra_geometry/*/geometry_summary.json`, produced by `experiment_extra_metrics.py`. All 18 have shuffled rho below native rho.
- The `4 of 12 concepts` count is in `results_synthetic_nomodel/concept_f1/summary.json`. It belongs to the local no-model/synthetic Concept-F1 baseline, not the released InterPLM attack grid.
- No InterPLM-grid per-cell outputs were found for single-latent F1, decoder-geometry rho, or SAEBench k-sparse. Separate ordinary project-SAE results exist, but are not InterPLM-grid results.
