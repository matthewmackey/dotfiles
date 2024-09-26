#!/bin/bash

# See: https://unix.stackexchange.com/questions/422111/linux-mint-cinnamon-18-in-what-file-are-the-keyboard-shortcuts-saved

EXPORT_DIR=$DOTDIR/desktop/cinnamon
KEYBINDINGS_EXPORT=$EXPORT_DIR/keybindings.conf


test ! -d "$EXPORT_DIR" && mkdir -p "$EXPORT_DIR"

dconf dump /org/cinnamon/desktop/keybindings/ > "$KEYBINDINGS_EXPORT"
