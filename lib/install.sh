#!/bin/bash

CONFIG_DIR=$DOTDIR/.config

REMOTE_CONFIGS=(
  bash
  nvim
  psql
  readline
  sh
  starship
  vim
  zsh
)

LOCAL_CONFIGS=(
  alacritty
  awesome
  parcellite
  tmux
  xmodmap
)

setupRemoteConfigDirSymlinks() {
  print_step "Setting up REMOTE dotfile symlinks in ~/.config"
  for conf in ${REMOTE_CONFIGS[@]}; do
    create_symlink_with_backup $CONFIG_DIR/$conf ~/.config/$conf
  done
}

setupLocalConfigDirSymlinks() {
  print_step "Setting up LOCAL dotfile symlinks in ~/.config"
  for conf in ${LOCAL_CONFIGS[@]}; do
    create_symlink_with_backup $CONFIG_DIR/$conf ~/.config/$conf
  done
}

setupRemoteHomeDirSymlinks() {
  print_step "Setting up REMOTE dotfile symlinks in ~/ directory"
  create_symlink_with_backup ~/.config/bash/.bash_profile ~/.bash_profile
  create_symlink_with_backup ~/.config/bash/.bashrc       ~/.bashrc
  create_symlink_with_backup ~/.config/psql/.psqlrc       ~/.psqlrc
  create_symlink_with_backup ~/.config/readline/inputrc    ~/.inputrc
  create_symlink_with_backup ~/.config/vim                ~/.vim
  create_symlink_with_backup ~/.config/zsh/.zshenv        ~/.zshenv

}

setupLocalHomeDirSymlinks() {
  print_step "Setting up LOCAL dotfile symlinks in ~/ directory"
  create_symlink_with_backup ~/.config/tmux               ~/.tmux
  create_symlink_with_backup ~/.config/tmux/tmux.conf     ~/.tmux.conf
}


setupLocalDotfiles() {
  print_step "Setup local dotfiles directory if it does not exist"
  if [ ! -d $LOCAL_DOTDIR ]; then
    msg "Making local dotfiles directory $LOCAL_DOTDIR"
    mkdir -p $LOCAL_DOTDIR

    msg "Initializing local dotfiles directory as git repository"
    cd $LOCAL_DOTDIR
    git init

    msg "Creating empty 'desktop' directory in repo for .desktop files"
    mkdir desktop

    msg "Creating symlink to .desktop files directory in ~/.local/share/applications"
    create_symlink_with_backup $LOCAL_DOTDIR/desktop ~/.local/share/applications/local_dotdir

    msg "Creating empty local 'aliases' file in repo"
    touch aliases

    msg "Creating empty local 'rc' file in repo"
    touch rc

    msg "Committing empty local aliases/rc files"
    git add aliases rc
    git commit -m"Initial commit - adding empty aliases/rc files"
  else
    skipping "Local dotfiles directory at $LOCAL_DOTDIR already exists"
  fi
}
