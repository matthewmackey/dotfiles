#!/bin/bash

set -e
set -o pipefail

msg() {
  printf "%s\n" "$1"
}

create_symlink_with_backup() {
  local _target=$1
  local _link_name=$2
  local _target_dir=${3:-$HOME}

  (
    cd "$_target_dir"
    if [ ! -e "$_link_name" ]; then
      msg "[$_link_name] does not exist -> creating symlink"
      ln -s "$_target" "$_link_name"

    elif [ -L "$_link_name" ]; then
      msg "[$_link_name] exists AND is symlink"

      msg "Deleting [$(ls -al $_link_name)]"
      rm "$_link_name"

      ln -s "$_target" "$_link_name"
      msg "Created [$_link_name] symlink"

    else
      msg "[$_link_name] exists AND is NOT a symlink"
      local _backup=$_link_name.bak."$(date '+%F-%H%M%S')"

      msg "Moving existing [$_link_name] to -> [$_backup]"
      mv "$_link_name" "$_backup"

      ln -s "$_target" "$_link_name"
      msg "Created [$_link_name] symlink"
    fi

    echo
  )
}

#-------------------------------#
# MAIN                          #
#-------------------------------#
CONFIG_DIR=~/dotfiles/.config
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
for conf in ${CONFIGS[@]}; do
  create_symlink_with_backup $CONFIG_DIR/$conf ~/.config/$conf
done

create_symlink_with_backup $CONFIG_DIR/bash/.bash_profile ~/.bash_profile
create_symlink_with_backup $CONFIG_DIR/bash/.bashrc ~/.bashrc
create_symlink_with_backup $CONFIG_DIR/zsh/.zshenv ~/.zshenv

create_symlink_with_backup ~/.config/vim ~/.vim
