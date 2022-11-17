#!/bin/bash

set -e
set -o pipefail

NVM_VERSION=v0.39.1

source $DOTDIR/lib/common.sh

# Ensure NVM_HOME is in environment in case this script is running immediately
# after dotfiles were installed and shell hasn't been reloaded
source $DOTDIR/.config/sh/includes/node.sh

section "Installing nvm"

print_step "Installing nvm to $NVM_HOME"
if [ ! -f $NVM_HOME/nvm.sh ]; then
  if [ ! -d $NVM_HOME ]; then
    mkdir -p $NVM_HOME
  fi
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
else
  skipping "nvm has already installed"
fi
