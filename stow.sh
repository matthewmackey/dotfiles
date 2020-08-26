#!/bin/sh
for i in bash desktop git mmbin parcellite ssh tmux vim; do
  echo "Running stow for -> [$i]"
  stow $i
done
