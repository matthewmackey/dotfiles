#!/bin/sh
for i in bash git ssh tmux vim; do
  echo "Running stow for -> [$i]"
  stow $i
done
