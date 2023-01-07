#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

GIT_DOTDIR=$DOTDIR/.config/git

GITCONFIG_LOCAL=$LOCAL_DOTDIR/.gitconfig_local
GITCONFIG_LOCAL_SYMLINK=~/.config/git/.gitconfig_local

GITCONFIG_LOCAL_TOUCH_FILE=$GIT_DOTDIR/.gitconfig_local.already_setup

DEFAULT_GIT_NAME="Matthew Machaj"
DEFAULT_GIT_EMAIL="21043873+matthewmackey@users.noreply.github.com"
DEFAULT_GIT_EMAIL2="73896224+matthewmachaj@users.noreply.github.com"

setup_gitconfig_local() {
  print_step "Setting name & email in $GITCONFIG_LOCAL"

  if [ ! -e $GITCONFIG_LOCAL_TOUCH_FILE ]; then
    delete_symlink_or_create_backup $GITCONFIG_LOCAL

    read -p "$(printf "Hit ENTER to accept default values in brackets for prompts below.\n\n")"
    printf "\n"
    read -p "Provide $GITCONFIG_LOCAL 'user.name' [$DEFAULT_GIT_NAME]: " GIT_NAME

    printf "\n"
    _prompt=$(printf "%s\n\n  %s\n  %s\n\n%s" \
      "Provide $GITCONFIG_LOCAL 'user.email':" \
      "[$DEFAULT_GIT_EMAIL]" \
      "$DEFAULT_GIT_EMAIL2" \
      "Type email or hit Enter for default: "
    )
    read -p "$_prompt" GIT_EMAIL

    cat > $GITCONFIG_LOCAL <<GIT_CONFIG
[user]
  name = ${GIT_NAME:-$DEFAULT_GIT_NAME}
  email = ${GIT_EMAIL:-$DEFAULT_GIT_EMAIL}
GIT_CONFIG

    echo
    cat $GITCONFIG_LOCAL

    touch $GITCONFIG_LOCAL_TOUCH_FILE
    create_symlink_with_backup $GITCONFIG_LOCAL $GITCONFIG_LOCAL_SYMLINK
  else
    skipping "$GITCONFIG_LOCAL has already been configured on this computer"
  fi
}

setup_gitconfig_local
