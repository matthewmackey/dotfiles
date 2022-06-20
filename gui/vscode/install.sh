#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

print_step "Setup VSCode Settings"

# Map personal VS Code dotdir into ~/.config/vscode
VSCODE_DOTDIR=~/.config/vscode
create_symlink_with_backup $DOTDIR/gui/vscode $VSCODE_DOTDIR

VSCODE_REAL_DIR=~/.config/Code/User
create_symlink_with_backup $VSCODE_DOTDIR/keybindings.json $VSCODE_REAL_DIR/keybindings.json
create_symlink_with_backup $VSCODE_DOTDIR/settings.json $VSCODE_REAL_DIR/settings.json
