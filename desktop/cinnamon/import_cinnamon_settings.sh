#!/bin/bash

EXPORT_DIR=$DOTDIR/desktop/cinnamon

KEYBINDINGS_EXPORT=$EXPORT_DIR/keybindings.conf


dconf load /org/cinnamon/desktop/keybindings/ < "$KEYBINDINGS_EXPORT"
