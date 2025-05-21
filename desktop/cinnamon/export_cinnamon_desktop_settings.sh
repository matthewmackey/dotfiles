#!/bin/bash

# See: https://unix.stackexchange.com/questions/422111/linux-mint-cinnamon-18-in-what-file-are-the-keyboard-shortcuts-saved

DCONF_PATH="/org/cinnamon/desktop/"

EXPORT_DIR=$DOTDIR/desktop/cinnamon
DESKTOP_EXPORT=$EXPORT_DIR/cinnamon-desktop-dconf-settings.conf

export_cinnamon() {
  test ! -d "$EXPORT_DIR" && mkdir -p "$EXPORT_DIR"
  dconf dump $DCONF_PATH >"$DESKTOP_EXPORT"
}

import_cinnamon() {
  dconf load $DCONF_PATH <"$DESKTOP_EXPORT"
}

if [ "$1" = "-e" ]; then
  export_cinnamon
elif [ "$1" = "-i" ]; then
  import_cinnamon
else
  echo "You must provide: [-i | -e]"
  exit 1
fi
