#!/bin/bash

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
