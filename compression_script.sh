#!/usr/bin/env bash

mkdir "random_selection_compression"
for f in *.mp3; do
    ffmpeg -i "$f" -ab 10k -ar 16000 "./random_selection_compression/10k_16k$f"
done
