#!/bin/bash

OUT_ZIP=~/mmackey.bak.zip

# NOTE: paths in list files must be relative to $HOME
INCLUDES_LIST=~/mmackey_backup.lst
EXCLUDES_LIST=~/mmackey_backup_excludes.lst


cd ~/
cat "$INCLUDES_LIST" | zip "$OUT_ZIP" --recurse-paths --exclude @"$EXCLUDES_LIST" -@

