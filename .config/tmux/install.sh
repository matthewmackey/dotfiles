#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

_TMUX_PLUGIN_MANAGER_PATH=~/.config/tmux/plugins

print_step "Installing Tmux Plugin Manager (TPM)"
if [ ! -d $_TMUX_PLUGIN_MANAGER_PATH/tpm/.git ]; then
  git clone https://github.com/tmux-plugins/tpm $_TMUX_PLUGIN_MANAGER_PATH/tpm
fi
unset _TMUX_PLUGIN_MANAGER_PATH

if ! command -v xsel >/dev/null && ! command -v xclip >/dev/null ; then
  warn "[WARN] 'tmux-yank' won't work; it requires 'xsel' or 'xclip' (via 'apt install')"
fi

alert "TMUX Note" "hit Prefix+I to install Tmux TPM plugins"
