#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

#-------------------------------#
# MAIN                          #
#-------------------------------#
section "Install Python 3 'neovim' provider"

print_step "Install Python 3 'neovim' module into default virtualenv if it exists yet"

if [ -f $DEFAULT_PYTHON/bin/python3 ]; then
  msg "Virtualenv exists so installing/re-installing 'neovim' module"
  $DEFAULT_PYTHON/bin/pip3 install neovim
else
  skipping "Python 3 default virtualenv does NOT exist so installing module"
  warn "Some parts of Neovim may not work; make sure you run Ansible to install your default Python 3"
fi
