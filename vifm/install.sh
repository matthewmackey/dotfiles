#!/bin/bash

set -e
set -o pipefail

if [ ! -L ~/.vifm/vifmrc ]; then
  ln -s ~/dotfiles/vifm/.vifm/vifmrc ~/.vifm/vifmrc
fi

if [ ! -d ~/.vifm/scripts ]; then
  ln -s ~/dotfiles/vifm/.vifm/scripts ~/.vifm/scripts
fi
