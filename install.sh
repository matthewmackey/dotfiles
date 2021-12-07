#!/bin/sh

set -e

msg() {
  printf "%s\n" "$1"
}

install_packages() {
  sudo apt install -y tmux vim zsh
}

install_yh() {
  # Install `yh` YAML formatter
  go get github.com/andreazorzetto/yh
}


install_kubectx() {
  # Install kubectx
  if [ ! -f ~/bin/kubectx -a ! -f ~/bin/kubens ]; then
    curl -L https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx_v0.9.4_linux_x86_64.tar.gz -o /tmp/kubectx-0.9.4.tar.gz
    curl -L https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens_v0.9.4_linux_x86_64.tar.gz -o /tmp/kubens-0.9.4.tar.gz
    {
      cd ~/bin
      tar xzf /tmp/kubectx-0.9.4.tar.gz
      tar xzf /tmp/kubens-0.9.4.tar.gz
      rm LICENSE
    }
  fi
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
# install_yh
# install_kubectx

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
