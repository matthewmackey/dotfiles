#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

GIT_DOTDIR=$DOTDIR/git

GITCONFIG_TOUCH_FILE=~/.gitconfig.already_setup

DEFAULT_GIT_NAME="Matthew Machaj"
DEFAULT_GIT_EMAIL="21043873+matthewmackey@users.noreply.github.com"
DEFAULT_GIT_EMAIL2="73896224+matthewmachaj@users.noreply.github.com"

setup_gitignore() {
  print_step "Setting up ~/.gitignore_global"
  create_symlink_with_backup $GIT_DOTDIR/.gitignore_global ~/.gitignore_global
}

setup_gitmessage() {
  print_step "Setting up ~/.gitmessage.txt"
  create_symlink_with_backup $GIT_DOTDIR/.gitmessage.txt ~/.gitmessage.txt
}

setup_gitconfig() {
  print_step "Setting name & email in ~/.gitconfig"
  if [ ! -e $GITCONFIG_TOUCH_FILE ]; then
    delete_symlink_or_create_backup ~/.gitconfig

    read -p "$(printf "Hit ENTER to accept default values in brackets for prompts below.\n\n")"
    printf "\n"
    read -p "Provide ~/.gitconfig 'user.name' [$DEFAULT_GIT_NAME]: " GIT_NAME

    printf "\n"
    _prompt=$(printf "%s\n\n  %s\n  %s\n\n%s" \
      "Provide ~/.gitconfig 'user.email':" \
      "[$DEFAULT_GIT_EMAIL]" \
      "$DEFAULT_GIT_EMAIL2" \
      "Type email or hit Enter for default: "
    )
    read -p "$_prompt" GIT_EMAIL

    cat > ~/.gitconfig <<GIT_CONFIG
[user]
  name = ${GIT_NAME:-$DEFAULT_GIT_NAME}
  email = ${GIT_EMAIL:-$DEFAULT_GIT_EMAIL}

[include]
  path = $GIT_DOTDIR/.gitconfig
GIT_CONFIG

    echo
    cat ~/.gitconfig

    touch $GITCONFIG_TOUCH_FILE
  else
    skipping "~/.gitconfig has already been configured on this computer"
  fi
}

setup_gitignore
setup_gitmessage
setup_gitconfig
