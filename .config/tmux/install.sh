#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh


_TMUX_PLUGIN_MANAGER_PATH=~/.config/tmux/plugins
_TMUX_RESURRECT_DIR=~./config/tmux/resurrect


print_step "Installing Tmux Plugin Manager (TPM)"
if [ ! -d $_TMUX_PLUGIN_MANAGER_PATH/tpm/.git ]; then
  git clone https://github.com/tmux-plugins/tpm $_TMUX_PLUGIN_MANAGER_PATH/tpm
fi

# This is needed b/c when we first run dotfiles/install.sh on a new machine,
# install.sh lays down our custom tmux.conf file that sets TMUX_PLUGIN_MANAGER_PATH
# just before this script is run.  Thus, if we are in an active
# tmux session when running install.sh, that new config will not be loaded into
# our tmux session so the `install_plugins` step # below will fail.
#
# See: https://github.com/RiddleMan/dotfiles/issues/97
print_step "Reload current tmux session's config to ensure TMUX_PLUGIN_MANAGER_PATH exists in the tmux environment"
if [ -z "$TMUX" ]; then
  skipping "Not currently in a tmux session so nothing to do"
else
  tmux source ~/.tmux.conf
  msg "Reloaded tmux config at ~/.tmux.conf into the current session"
fi

print_step "Installing TPM Plugins"
$_TMUX_PLUGIN_MANAGER_PATH/tpm/bin/install_plugins
# alert "TMUX Note" "hit Prefix+I to install Tmux TPM plugins"

# It seems that tmux-resurrect will not create this directory and seesions
# will therefore not be stored unless this is manually created - ?? not sure why
# this is the case.
print_step "Making tmux-resurrect directory exists so resurrect data can be stored"
if [ ! -d "$_TMUX_RESURRECT_DIR" ]; then
  mkdir -p "$_TMUX_RESURRECT_DIR"
  msg "tmux-resurrect directory successfully created"
else
  skipping "tmux-resurrect directory already exists"
fi

unset _TMUX_RESURRECT_DIR
unset _TMUX_PLUGIN_MANAGER_PATH

if ! command -v xsel >/dev/null && ! command -v xclip >/dev/null ; then
  warn "[WARN] 'tmux-yank' won't work; it requires 'xsel' or 'xclip' (via 'apt install')"
fi

