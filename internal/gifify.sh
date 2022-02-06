#!/usr/bin/env bash

set -eu

ffmpeg -i "$1" -vf "setpts=0.5*PTS,fps=16,split[s0][s1];[s0]palettegen=max_colors=128:reserve_transparent=0[p];[s1][p]paletteuse" "$2"
