#!/bin/sh

DIR=~/.config/xmodmap

if [ ! -L $DIR ]; then
  ln -s ~/dotfiles/xmodmap $DIR
fi

