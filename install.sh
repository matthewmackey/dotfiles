#!/bin/bash

msg() {
  printf "%s\n" "$1"
}

#-------------------------------#
# SYMLINK - .bashrc             #
#-------------------------------#
if [ ! -e ~/.bashrc ]; then
  msg ".bashrc does not exist -> creating symlink"
  ln -s ~/dotfiles/.bashrc ~/.bashrc
elif [ -L ~/.bashrc ]; then
  msg ".bashrc exists AND is symlink"
  msg "Deleting $(ls -al ~/.bashrc)"
  rm ~/.bashrc
  msg "Creating .bashrc symlink"
  ln -s ~/dotfiles/.bashrc ~/.bashrc
else
  msg ".bashrc exists AND is NOT a symlink"
fi


#./ssh/install.sh
#./tmux/install.sh
#./vim/install.sh
