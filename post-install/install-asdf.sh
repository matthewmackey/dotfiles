#!/bin/bash

set -e
set -o pipefail

ASDF_VERSION=v0.10.2
ASDF_PLUGIN_HOME=$ASDF_HOME/plugins
APT_CACHE_LAST_UPDATE_MINS=60

source $DOTDIR/lib/common.sh

# Ensure ASDF_HOME is in environment in case this script is running immediately
# after dotfiles were installed and shell hasn't been reloaded
source $DOTDIR/.config/sh/includes/asdf.sh

section "Installing asdf"

print_step "Cloning asdf repository to $ASDF_HOME"
if [ ! -d ${ASDF_HOME} ]; then
  git clone https://github.com/asdf-vm/asdf.git $ASDF_HOME --branch $ASDF_VERSION
else
  skipping "asdf repository has already been cloned to $ASDF_HOME-> asdf is considered already installed"
fi

# Enable `asdf` to get access to `asdf plugin` commands
source $ASDF_HOME/asdf.sh

section "Installing asdf Plugins"

print_step "Refreshing APT cache"
# See: https://unix.stackexchange.com/questions/271000/update-apt-get-cache-only-if-its-older-than-certain-time
# See: https://viewsby.wordpress.com/2012/08/24/linux-find-mmin-minutes/
if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -$APT_CACHE_LAST_UPDATE_MINS)" ]; then
  sudo apt-get update
else
  skipping "APT cache was updated within last $APT_CACHE_LAST_UPDATE_MINS minutes"
fi

# NODE.JS
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

# PYTHON
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

# RUBY
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
