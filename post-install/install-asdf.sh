#!/bin/bash

set -e
set -o pipefail

clone_asdf_repo_to_asdf_home() {
  print_step "Cloning asdf repository to $ASDF_HOME"
  if [ ! -d ${ASDF_HOME} ]; then
    git clone https://github.com/asdf-vm/asdf.git $ASDF_HOME --branch $ASDF_VERSION
  else
    skipping "asdf repository has already been cloned to $ASDF_HOME-> asdf is considered already installed"
  fi
}

refresh_apt_cache() {
  print_step "Refreshing APT cache"
  # See: https://unix.stackexchange.com/questions/271000/update-apt-get-cache-only-if-its-older-than-certain-time
  # See: https://viewsby.wordpress.com/2012/08/24/linux-find-mmin-minutes/
  if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -$APT_CACHE_LAST_UPDATE_MINS)" ]; then
    sudo apt-get update
  else
    skipping "APT cache was updated within last $APT_CACHE_LAST_UPDATE_MINS minutes"
  fi
}

# NODE.JS
install_node_plugin() {
  print_step "Installing asdf [node.js] plugin"
  if [ ! -d $ASDF_PLUGIN_HOME/nodejs ]; then
    # Install Node.js plugin pre-requisites
    #   https://github.com/asdf-vm/asdf-nodejs
    #   https://github.com/nodejs/node/blob/main/BUILDING.md#unix-prerequisites
    sudo apt-get install -y \
      g++ \
      make \
      python3 \
      python3-pip
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || \
    echo "[ERROR] installing Node.js plugin"
  else
    skipping "asdf [node.js] plugin is already installed"
  fi
}

# PYTHON
install_python_plugin(){
  print_step "Installing asdf [python] plugin"
  if [ ! -d $ASDF_PLUGIN_HOME/python ]; then
    # Install Python plugin pre-requisites
    #   https://github.com/asdf-community/asdf-python
    #   https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    sudo apt-get install -y \
      build-essential \
      curl \
      libbz2-dev \
      libffi-dev \
      liblzma-dev \
      libncursesw5-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libxmlsec1-dev \
      libxml2-dev \
      llvm \
      make \
      tk-dev \
      wget \
      xz-utils \
      zlib1g-dev && \
    asdf plugin add python https://github.com/asdf-community/asdf-python.git || \
    echo "[ERROR] installing Python plugin"
  else
    skipping "asdf [python] plugin is already installed"
  fi
}

# RUBY
install_ruby_plugin() {
  print_step "Installing asdf [ruby] plugin"
  if [ ! -d $ASDF_PLUGIN_HOME/ruby ]; then
    # Install Ruby plugin pre-requisites
    #   https://github.com/asdf-vm/asdf-ruby
    #   https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
    sudo apt-get install -y \
      autoconf \
      bison \
      build-essential \
      libdb-dev \
      libffi-dev \
      libgdbm6 \
      libgdbm-dev \
      libncurses5-dev \
      libreadline6-dev \
      libssl-dev \
      libyaml-dev \
      uuid-dev \
      zlib1g-dev && \
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git || \
    echo "[ERROR] installing Ruby plugin"
  else
    skipping "asdf [ruby] plugin is already installed"
  fi
}

install_direnv() {
  print_step "Installing [direnv] utility"
  if [ ! -e $DIRENV_INSTALL_DIR/direnv ]; then
    # NOTE the 'v' prefix before $DIRENV_VERSION
    (export bin_path=$DIRENV_INSTALL_DIR ; export version="v$DIRENV_VERSION" ; curl -sfL https://direnv.net/install.sh | bash);
    echo "[ERROR] installing direnv"
  else
    skipping "'direnv' is already installed"
  fi
}

# asdf-direnv - https://github.com/asdf-community/asdf-direnv
install_direnv_plugin() {
  print_step "Installing asdf [direnv] plugin"

  if [ ! -d $ASDF_PLUGIN_HOME/direnv ]; then
    asdf plugin add direnv || \
    echo "[ERROR] installing direnv plugin"
  else
    skipping "asdf [direnv] plugin is already installed"
  fi
}

setup_direnv_plugin() {
  print_step "Setting up asdf [direnv] plugin"

  if [ ! -e $DIRENV_ASDF_INTEGRATION_SCRIPT ]; then
    # Install direnv, set version installed as global version (add to ~/.tool-versions), and setup plugin
    asdf direnv setup --shell $SHELL --version $DIRENV_VERSION && \
    asdf global direnv $DIRENV_VERSION && \
    echo "[ERROR] setting up direnv plugin"
  else
    skipping "asdf [direnv] plugin is already setup"
  fi
}


#-------------------------------------------------------------------------------
# MAIN
#-------------------------------------------------------------------------------
ASDF_VERSION=v0.10.2
APT_CACHE_LAST_UPDATE_MINS=60
DIRENV_ASDF_INTEGRATION_SCRIPT=${XDG_CONFIG_HOME:-$HOME/.config}/direnv/lib/use_asdf.sh
DIRENV_INSTALL_DIR=~/.local/bin
DIRENV_VERSION=2.32.2

section "Setup: ASDF post-install"

print_step "Sourcing [$DOTDIR/lib/common.sh]"
source $DOTDIR/lib/common.sh

# Ensure ASDF_HOME is in environment in case this script is running immediately
# after dotfiles were installed and shell hasn't been reloaded
print_step "Sourcing asdf include to load ASDF_HOME"
source_file_if_exists_or_fail $DOTDIR/.config/sh/includes/asdf.sh
ASDF_PLUGIN_HOME=$ASDF_HOME/plugins # Must be done after loading ASDF_HOME

section "Installing asdf"

clone_asdf_repo_to_asdf_home

section "Enabling asdf command"

# Enable `asdf` to get access to `asdf plugin` commands
source_file_if_exists_or_fail $ASDF_HOME/asdf.sh

section "Installing language asdf Plugins"

refresh_apt_cache
install_node_plugin
install_python_plugin
install_ruby_plugin

section "Installing 'direnv' asdf Plugins"
# Use the `asdf direnv` plugin to do the `direnv` install instead of manually installing
install_direnv_plugin
# install_direnv
setup_direnv_plugin
