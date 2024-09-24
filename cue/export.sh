#!/usr/bin/env bash

target="../manifests/dev"

cd configs || exit 1

for dir in *
do
  
  for file in "$dir"/*.cue
  do
    cue export -t dev "$file" --out yaml > "$target/${file%.cue}.yaml"
  done

done
