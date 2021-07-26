#!/bin/bash

set -e
set -o pipefail

#-------------------------------#
# SYMLINK - .vimrc              #
#-------------------------------#
if [ ! -L ~/.vimrc ]; then
  ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
fi

#-------------------------------#
# SYMLINK - .vim                #
#-------------------------------#
if [ ! -L ~/.vim ]; then
  ln -s ~/dotfiles/vim/.vim ~/.vim
fi

#-------------------------------#
# Install vim-plug              #
#-------------------------------#
sudo apt install -y curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#-------------------------------#
# Install Language Servers      #
#-------------------------------#
cat <<EOF

#----------------------------------------#
# vim/install.sh
#----------------------------------------#
You must install any language server binaries you need as well, like:

# Golang
# gopls -> may already come installed with golang itself

# Python
npm -g pyright

# Ruby
gem install sonargraph

# Typescript
npm -g typescript-language-server
EOF
