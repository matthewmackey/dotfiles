#!/bin/bash

#-------------------------------#
# SYMLINK - .vimrc              #
#-------------------------------#
if [ ! -L ~/.vimrc ]; then
  ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
fi

#-------------------------------#
# SYMLINK - .vim                #
#-------------------------------#
if [ ! -L ~/.vim ]; then
  ln -s ~/dotfiles/vim/.vim ~/.vim
fi
