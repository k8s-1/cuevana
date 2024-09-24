#!/usr/bin/env bash

cd configs || exit 1

for dir in *
do

  mkdir -p ../../manifests/dev/"$dir"
  
  for file in "$dir"/*.cue
  do
    cue export -t dev "$file" --out yaml > "../../manifests/${file%.cue}.yaml"
  done

done
