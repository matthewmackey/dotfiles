#!/bin/sh
for i in bash git mmbin ssh tmux vim; do
  echo "Running stow for -> [$i]"
  stow $i
done
