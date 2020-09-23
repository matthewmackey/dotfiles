#!/bin/sh
for i in bash desktop git mmbin parcellite ssh tmux vim vscode; do
  echo "Running stow for -> [$i]"
  stow $i
done
