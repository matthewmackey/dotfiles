#!/bin/bash

#-------------------------------#
# SYMLINK - .bashrc             #
#-------------------------------#
if [[ ! -L ~/.bashrc ]]; then
  ln -s ~/dotfiles/.bashrc ~/.bashrc
fi


./ssh/install.sh
./tmux/install.sh
./vim/install.sh
