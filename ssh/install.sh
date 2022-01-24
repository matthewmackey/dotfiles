#!/bin/bash

set -e
set -o pipefail

source $DOTDIR/lib/common.sh

print_step "Setting up SSH config files & directory structure"

setup_main_ssh_config_file() {
  section "Creating empty main SSH config if one doesn't exist"

  local _main_ssh_config_file=~/.ssh/config

  if [ ! -e $_main_ssh_config_file ]; then
    msg "$_main_ssh_config_file doesn't exist so creating empty file there"
    touch $_main_ssh_config_file
  else
    msg "$_main_ssh_config_file exists so doing nothing"
  fi
}

setup_local_ssh_config_file() {
  section 'Creating empty "local" SSH config if one does not exist'

  local _local_ssh_config_file=~/.ssh/config-local

  if [ ! -e $_local_ssh_config_file ]; then
    msg "$_local_ssh_config_file doesn't exist so creating empty file there"
    touch $_local_ssh_config_file
  else
    msg "$_local_ssh_config_file exists so doing nothing"
  fi
}

setup_ssh_extra_conf_dir() {
  section "Setting up extra SSH config directory"

  local _ssh_extra_conf_dir=~/.ssh/conf.d

  if [ ! -d ~/.ssh/conf.d ]; then
    msg "Creating extra SSH config directory at $_ssh_extra_conf_dir"
    mkdir -p $_ssh_extra_conf_dir
  else
    msg "$_ssh_extra_conf_dir already exists so doing nothing"
  fi
}

setup_main_ssh_config_file
setup_local_ssh_config_file
setup_ssh_extra_conf_dir
