#!/usr/bin/env bash

target="../manifests/dev"

for dir in configs/*
do
  # echo "$dir"
  
  for file in "$dir"/*.cue
  do
    cue export -t dev "$file" --out yaml > "$target"
  done

done
