#!/usr/bin/env bash

cd configs || exit 1

for dir in *
do

  mkdir -p ../../manifests/dev/"$dir"
  
  for path in "$dir"/*.cue
  do
    cue export -t dev "$path" --out yaml > "../../manifests/dev/${path%.cue}.yaml"
  done

done
