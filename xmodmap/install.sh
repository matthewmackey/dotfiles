#!/bin/sh

DIR=~/.config/xmodmap
FILE=.xmodmap-esc

if [ ! -d $DIR ]; then
  mkdir -p $DIR
fi

ln -s ~/dotfiles/xmodmap/$FILE $DIR/$FILE
