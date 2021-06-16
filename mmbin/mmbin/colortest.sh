#!/bin/bash

COLORTEST_BIN=~/.config/base16-shell/colortest

if [ "$1" = "-l" ]; then
  ls ~/.config/base16-shell/scripts
else
  $COLORTEST_BIN "$@"
fi
