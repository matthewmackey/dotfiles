#!/bin/bash

TMUX_PLUGIN_MANAGER_PATH=~/.config/tmux/plugins
if [[ ! -d $TMUX_PLUGIN_MANAGER_PATH/tpm/.git ]]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_PATH/tpm
fi

if ! command -v xsel >/dev/null && ! command -v xclip >/dev/null ; then
  echo "[WARN] 'tmux-yank' won't work; it requires 'xsel' or 'xclip' (via 'apt install')"
fi

printf "\n[TMUX Note] hit Prefix+I to install Tmux TPM plugins\n"
