#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

print_step "Linking static .desktop files into ~/.local"
create_symlink_with_backup $DOTDIR/desktop ~/.local/share/applications/personal
