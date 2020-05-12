#!/bin/bash

# Base16 terminal colorscheme manager (also configures ~/.vimrc_background)
if [[ ! -d ~/.config/base16-shell/.git ]]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
else
  echo "Base16 Shell already installed"
fi
