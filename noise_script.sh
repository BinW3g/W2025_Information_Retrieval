#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

mkdir "random_selection_gaussian"
OUT_DIR="./random_selection_gaussian"

for f in *.mp3; do
  base="${f##*/}"
  [[ "$base" == gaussian_* ]] && continue

  out="$OUT_DIR/gaussian_$base"

  ffmpeg -hide_banner -y -i "$f" \
    -filter_complex "anoisesrc=color=white:amplitude=0.1 [n]; [0:a][n] amix=inputs=2:weights=1 0.8:duration=shortest" \
    -c:a libmp3lame -b:a 192k \
    "$out"
done

