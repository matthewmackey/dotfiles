#!/bin/bash

set -e
set -o pipefail

SRC=~/dotfiles/i3/.config/i3/config
DEST=~/.config/i3/config
if [ ! -L $DEST ]; then
  ln -s $SRC $DEST
fi
