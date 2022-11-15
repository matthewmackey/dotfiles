#!/bin/bash

set -e
set -o pipefail

# Override any DOTDIR currently set in environment since we are doing an install
# that is changing the DOTDIR to the standard set for this repository
export DOTDIR=~/.personal/dotfiles

source $DOTDIR/lib/common.sh
source $DOTDIR/lib/install.sh

setupPersonalSystem
