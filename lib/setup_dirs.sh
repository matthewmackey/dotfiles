#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

DIRS=(
  Applications
  docs
  downloads/debs
  .local/share/ca-certificates
  logs
  media
  srv
  tmp
  work
)

for d in "${DIRS[@]}"; do
  mkdir_if_not_exist $HOME/$d
done

LINKS=(
  desktop:Desktop
  docs:Documents
  downloads:Downloads
  # test ! -e media/music && ln -s Music media/music
  # test ! -e desktop && ln -s Pictures media/pics
  # test ! -e desktop && ln -s Videos media/videos

)

create_symlink_with_backup $HOME/Desktop desktop
create_symlink_with_backup $HOME/Documents docs
create_symlink_with_backup $HOME/Downloads downloads

create_symlink_with_backup $HOME/Music music $HOME/media
create_symlink_with_backup $HOME/Pictures pics $HOME/media
create_symlink_with_backup $HOME/Videos videos $HOME/media

mkdir_if_not_exist $HOME/media/pics/profile_pics

create_symlink_with_backup $HOME/media/pics/Screenshots screenshots
