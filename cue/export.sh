#!/usr/bin/env bash

mkdir -p ../manifests/dev

cd configs || exit 1

for dir in *
do
  
  for file in "$dir"/*.cue
  do
    cue export -t dev "$file" --out yaml > "../../manifests/${file%.cue}.yaml"
  done

done
