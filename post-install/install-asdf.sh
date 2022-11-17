#!/bin/bash

ASDF_VERSION=v0.10.2
ASDF_PLUGIN_HOME=$ASDF_HOME/plugins

# if [ ! -d ${ASDF_HOME} ]; then
  git clone https://github.com/asdf-vm/asdf.git ${ASDF_HOME} --branch ${ASDF_VERSION}
# fi

# Enable `asdf` to get access to `asdf plugin` commands
source $ASDF_HOME/asdf.sh

sudo apt-get update

# NODE.JS
if [ ! -d $ASDF_PLUGIN_HOME/nodejs ]; then
  # Install Node.js plugin pre-requisites
  #   https://github.com/asdf-vm/asdf-nodejs
  #   https://github.com/nodejs/node/blob/main/BUILDING.md#unix-prerequisites
  sudo apt-get install \
    g++ \
    make \
    python3 \
    python3-pip && \
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || \
  echo "[ERROR] installing Node.js plugin"
fi

# PYTHON
if [ ! -d $ASDF_PLUGIN_HOME/python ]; then
  # Install Python plugin pre-requisites
  #   https://github.com/asdf-community/asdf-python
  #   https://github.com/pyenv/pyenv/wiki#suggested-build-environment
  sudo apt-get install \
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
fi

# RUBY
if [ ! -d $ASDF_PLUGIN_HOME/ruby ]; then
  # Install Ruby plugin pre-requisites
  #   https://github.com/asdf-vm/asdf-ruby
  #   https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
  sudo apt-get install \
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
fi
