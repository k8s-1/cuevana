#!/usr/bin/env bash

cd configs || exit 1

for dir in *
do
  pwd
  
  echo mkdir -p "$target/$dir"
  mkdir -p "$target/$dir"

  for file in "$dir"/*.cue
  do
    cue export -t dev "$file" --out yaml > "../manifests/dev/${file%.cue}.yaml"
  done

done
