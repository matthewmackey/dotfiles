#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

print_step "Setting up SSH config files & directory structure"

section "Creating ~/.ssh if it doesn't exist"
mkdir_if_not_exist ~/.ssh

section "Symlink main SSH config"
create_symlink_with_backup $DOTDIR/ssh/config ~/.ssh/config

section "Setting up extra SSH config directory"
mkdir_if_not_exist ~/.ssh/conf.d
