#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

# Ensure BASE16_SHELL is in environment in case this script is running immediately
# after dotfiles were installed and shell hasn't been reloaded
source $DOTDIR/.config/sh/base16-shell.rc

section "Installing base16-shell"

print_step "Cloning base16-shell repository to $BASE16_SHELL"
if [ ! -d $BASE16_SHELL ]; then
  git clone https://github.com/chriskempson/base16-shell.git $BASE16_SHELL
else
  skipping "base16-shell repository has already been cloned to $BASE16_SHELL -> base16-shell is considered already installed"
fi
