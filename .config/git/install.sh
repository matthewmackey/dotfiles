#!/bin/bash

set -e
set -o pipefail

ln -s ~/dotfiles/git/.gitignore_global ~/.gitignore_global || true
ln -s ~/dotfiles/git/.gitmessage.txt   ~/.gitmessage.txt || true

delete_symlink_or_create_backup() {
  local _file=$1

  if [ -L $_file ]; then
    echo "[$_file] exists AND is symlink"

    echo "Deleting [$(ls -al $_file)]"
    rm $_file
  else
    if [ -e $_file ]; then
      echo "[$_file] exists AND is NOT a symlink"
      local _backup=$_file.bak."$(date '+%F-%H%M%S')"

      echo "Moving existing [$_file] to -> [$_backup]"
      mv $_file $_backup
    fi
  fi
}

DEFAULT_NAME="Matthew Machaj"
DEFAULT_NAME2="Matthew Mackey"
DEFAULT_EMAIL="73896224+matthewmachaj@users.noreply.github.com"
DEFAULT_EMAIL2="21043873+matthewmackey@users.noreply.github.com"
echo
echo "#------------------------------------------------------------------------"
echo "# Setting name & email in ~/.gitconfig"
echo "#------------------------------------------------------------------------"
delete_symlink_or_create_backup ~/.gitconfig

read -p "Provide ~/.gitconfig user.name [$DEFAULT_NAME / $DEFAULT_NAME2]: " GIT_USER_NAME
read -p "$(printf "Provide ~/.gitconfig user.email (must type out):\n - $DEFAULT_EMAIL\n - $DEFAULT_EMAIL2\n - Other\n\nEnter: ")" GIT_USER_EMAIL

cat > ~/.gitconfig <<GIT_CONFIG
[user]
  name = ${GIT_USER_NAME:-$DEFAULT_NAME}
  email = $GIT_USER_EMAIL

[include]
  path = ~/dotfiles/git/.gitconfig
GIT_CONFIG

echo
cat ~/.gitconfig

for i in dotfiles pc-setup
do
  echo
  echo "#------------------------------------------------------------------------"
  echo "# Setting name & email for ~/$i repo"
  echo "#------------------------------------------------------------------------"
  (
    cd ~/$i
    git config --local user.name "$DEFAULT_NAME"
    git config --local user.email "$DEFAULT_EMAIL"
    echo
    git config --local --list
  )
done
