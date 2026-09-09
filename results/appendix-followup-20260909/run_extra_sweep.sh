#!/bin/bash
cd ~/Me_and_Du_san_s_dirty_little_secret
mkdir -p results_extra logs_extra
PY=.venv/bin/python
for tree in outputs_ctrl outputs_ctrl_shuf outputs_ctrl_500tpp outputs_ctrl_shuf_500tpp outputs_ctrl_randominit; do
  for arm in "$tree"/ckpt_*; do
    [ -d "$arm" ] || continue
    for cell in "$arm"/layer_*; do
      [ -f "$cell/Z.npy" ] || continue
      tag="${tree#outputs_}_$(basename "$arm")_$(basename "$cell")"
      out="results_extra/$tag"
      if [ -f "$out/ksparse_probe.csv" ]; then echo "SKIP $tag"; continue; fi
      saearg=()
      if [ -f "$cell/sae_model.pt" ]; then
        fixed="/tmp/sae_unwrapped_$tag.pt"
        if $PY unwrap_sae.py "$cell/sae_model.pt" "$fixed"; then
          saearg=(--sae "$fixed")
        fi
      fi
      if $PY experiment_extra_metrics.py --layer-dir "$cell" --metric all "${saearg[@]}" --out "$out" > "logs_extra/$tag.log" 2>&1; then
        echo "DONE $tag"
      else
        echo "FAIL $tag (see logs_extra/$tag.log)"
      fi
    done
  done
done
echo ALL_DONE
