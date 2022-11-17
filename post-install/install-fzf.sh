#!/bin/bash

if [[ ! -d $FZF_HOME ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_HOME
  $FZF_HOME/install --no-bash --no-fish --no-zsh --no-key-bindings --no-completion --no-update-rc
fi
