# Block-shuffle batch (block size 16)

- Date: 2026-09-09
- Commit: 643c48ae70a6b244ac114166a147a06e73d20f50
- Seeds: 42 43 44 | Depths: 0 4 7 22 26 29 | tokens: 6.6e8 | n_shuffles: 5
- Metric settings unchanged: 8 A, |i-j| >= 12, top-10%

## Mean L_struct per cell

| arm | layer | mean L_struct |
|---|---:|---:|
| ckpt_clm_s42 | 0 | +0.02115 |
| ckpt_clm_s42 | 11 | +0.01034 |
| ckpt_clm_s42 | 14 | +0.00761 |
| ckpt_clm_s42 | 18 | +0.01032 |
| ckpt_clm_s42 | 22 | +0.01088 |
| ckpt_clm_s42 | 26 | +0.01167 |
| ckpt_clm_s42 | 29 | +0.01223 |
| ckpt_clm_s42 | 4 | +0.02778 |
| ckpt_clm_s42 | 7 | +0.01722 |
| ckpt_clm_s43 | 0 | +0.02275 |
| ckpt_clm_s43 | 11 | +0.01151 |
| ckpt_clm_s43 | 14 | +0.01056 |
| ckpt_clm_s43 | 18 | +0.00979 |
| ckpt_clm_s43 | 22 | +0.01021 |
| ckpt_clm_s43 | 26 | +0.01148 |
| ckpt_clm_s43 | 29 | +0.01186 |
| ckpt_clm_s43 | 4 | +0.01852 |
| ckpt_clm_s43 | 7 | +0.02036 |
| ckpt_clm_s44 | 0 | +0.02223 |
| ckpt_clm_s44 | 11 | +0.01198 |
| ckpt_clm_s44 | 14 | +0.00969 |
| ckpt_clm_s44 | 18 | +0.00778 |
| ckpt_clm_s44 | 22 | +0.00959 |
| ckpt_clm_s44 | 26 | +0.01037 |
| ckpt_clm_s44 | 29 | +0.01070 |
| ckpt_clm_s44 | 4 | +0.02217 |
| ckpt_clm_s44 | 7 | +0.02459 |
| ckpt_mlm_s42_token | 0 | +0.03007 |
| ckpt_mlm_s42_token | 11 | +0.01668 |
| ckpt_mlm_s42_token | 14 | +0.01405 |
| ckpt_mlm_s42_token | 18 | +0.01566 |
| ckpt_mlm_s42_token | 22 | +0.01105 |
| ckpt_mlm_s42_token | 26 | +0.00922 |
| ckpt_mlm_s42_token | 29 | +0.01099 |
| ckpt_mlm_s42_token | 4 | +0.01613 |
| ckpt_mlm_s42_token | 7 | +0.01665 |
| ckpt_mlm_s43_token | 0 | +0.02074 |
| ckpt_mlm_s43_token | 11 | +0.01920 |
| ckpt_mlm_s43_token | 14 | +0.01761 |
| ckpt_mlm_s43_token | 18 | +0.01780 |
| ckpt_mlm_s43_token | 22 | +0.01032 |
| ckpt_mlm_s43_token | 26 | +0.00844 |
| ckpt_mlm_s43_token | 29 | +0.01109 |
| ckpt_mlm_s43_token | 4 | +0.01776 |
| ckpt_mlm_s43_token | 7 | +0.02050 |
| ckpt_mlm_s44_token | 0 | +0.02853 |
| ckpt_mlm_s44_token | 11 | +0.01667 |
| ckpt_mlm_s44_token | 14 | +0.01479 |
| ckpt_mlm_s44_token | 18 | +0.01507 |
| ckpt_mlm_s44_token | 22 | +0.00962 |
| ckpt_mlm_s44_token | 26 | +0.01064 |
| ckpt_mlm_s44_token | 29 | +0.01157 |
| ckpt_mlm_s44_token | 4 | +0.02407 |
| ckpt_mlm_s44_token | 7 | +0.02454 |

Compare against outputs_ctrl (native) and outputs_ctrl_shuf (fully order-destroyed)
at the same arms and depths. The question is whether L_struct rises here too.
