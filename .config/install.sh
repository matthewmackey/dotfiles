#!/bin/bash

set -e
set -o pipefail

source $LIB_DIR/common.sh

#-------------------------------#
# MAIN                          #
#-------------------------------#
CONFIG_DIR=$DOTFILES_DIR/.config

print_step "Setting up dotfile symlinks in root of ~/ directory"
create_symlink_with_backup $CONFIG_DIR/bash/.bash_profile  ~/.bash_profile
create_symlink_with_backup $CONFIG_DIR/bash/.bashrc        ~/.bashrc
create_symlink_with_backup $CONFIG_DIR/tmux/tmux.conf      ~/.tmux.conf
create_symlink_with_backup $CONFIG_DIR/vim                 ~/.vim
create_symlink_with_backup $CONFIG_DIR/zsh/.zshenv         ~/.zshenv

CONFIGS=(
  alacritty
  awesome
  bash
  nvim
  sh
  starship
  tmux
  vim
  xmodmap
  zsh
)

print_step "Setting up ~/.config symlinks"
for conf in ${CONFIGS[@]}; do
  create_symlink_with_backup $CONFIG_DIR/$conf ~/.config/$conf
done

