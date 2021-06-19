#!/bin/bash

if [[ ! -d ~/.tmux/plugins/tpm/.git ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

if ! command -v xsel >/dev/null; then
  echo "[WARN] 'tmux-yank' won't work; it requires 'xsel' or 'xclip' (via 'apt install')"
fi

printf "\n[TMUX Note] hit Prefix+I to install Tmux TPM plugins\n"
