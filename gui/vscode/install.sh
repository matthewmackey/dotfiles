#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

VSCODE_DOTDIR=~/.config/vscode
VSCODE_REAL_DIR=~/.config/Code/User

print_step "Ensure $VSCODE_REAL_DIR directory exists"
mkdir_if_not_exist $VSCODE_REAL_DIR

print_step "Setup VSCode Settings"
create_symlink_with_backup $DOTDIR/gui/vscode $VSCODE_DOTDIR
create_symlink_with_backup $VSCODE_DOTDIR/keybindings.json $VSCODE_REAL_DIR/keybindings.json
create_symlink_with_backup $VSCODE_DOTDIR/settings.json $VSCODE_REAL_DIR/settings.json
