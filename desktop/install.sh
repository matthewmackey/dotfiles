#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

print_step "Linking static .desktop files into ~/.local"
create_symlink_with_backup $DOTDIR/desktop ~/.local/share/applications/personal

print_step "Linking autostart .desktop files into ~/.config/autostart"
create_symlink_with_backup $DOTDIR/desktop/synapse.desktop ~/.config/autostart/synapse.desktop
create_symlink_with_backup $DOTDIR/desktop/disable-gnome-ssh-agent.desktop ~/.config/autostart/gnome-keyring-ssh.desktop
