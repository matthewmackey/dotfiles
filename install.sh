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

  ln -s ~/dotfiles/.bashrc ~/.bashrc
  msg "Created.bashrc symlink"

else
  msg ".bashrc exists AND is NOT a symlink"
  bashrc_backup=~/.bashrc.bak."$(date +%F_%R)"

  msg "Moving existing .bashrc to -> [$bashrc_backup]"
  mv ~/.bashrc "$bashrc_backup"

  ln -s ~/dotfiles/.bashrc ~/.bashrc
  msg "Created.bashrc symlink"
fi


./git/install.sh
./vim/install.sh

# NOT for remote machines - TODO figure out how to flag when to run these
#./ssh/install.sh
#./tmux/install.sh
