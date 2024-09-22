#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

section "Switching Shell to zsh"

print_step "Running 'chsh' to switch to zsh"

CURR_SHELL=$(grep $USER /etc/passwd | cut -d: -f7)

if [ "$CURR_SHELL" != "/bin/zsh" ]; then
  chsh --shell /bin/zsh
  msg "Shell successfully changed"
else
  skipping "Shell for user [$USER] is already zsh"
fi
