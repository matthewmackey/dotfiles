#!/bin/sh

set -e

msg() {
  printf "%s\n" "$1"
}

install_packages() {
  sudo apt install -y tmux vim zsh
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
  )
}

#-------------------------------#
# MAIN                          #
#-------------------------------#
# install_packages
# create_symlink_with_backup ~/dotfiles/.bashrc .bashrc ~
# create_symlink_with_backup ~/dotfiles/.zshrc .zshrc ~
create_symlink_with_backup ~/dotfiles/alacritty.yml alacritty.yml ~/.config/alacritty

# ./git/install.sh
# ./shell/install.sh
# ./tmux/install.sh
# ./vim/install.sh
# ./vifm/install.sh

# NOT for remote machines - TODO figure out how to flag when to run these
#./ssh/install.sh
