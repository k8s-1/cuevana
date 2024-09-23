#!/usr/bin/env bash
new=1.1.1
sed "s/image: \".*\"/image: \"$new\"/" dev.cue
