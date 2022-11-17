#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

# Ensure FZF_HOME is in environment in case this script is running immediately
# after dotfiles were installed and shell hasn't been reloaded
source $DOTDIR/.config/sh/includes/fzf.sh

section "Installing fzf"

print_step "Cloning fzf repository to $FZF_HOME"
if [ ! -d $FZF_HOME ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_HOME
  $FZF_HOME/install --no-bash --no-fish --no-zsh --no-key-bindings --no-completion --no-update-rc
else
  skipping "fzf repository has already been cloned to $FZF_HOME -> fzf is considered already installed"
fi
