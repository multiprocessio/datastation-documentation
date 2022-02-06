#!/usr/bin/env bash

set -eu

ffmpeg -i "$1" -filter:v "setpts=0.5*PTS" "$2"
