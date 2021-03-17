#!/bin/bash

install_base16_shell() {
    # Base16 terminal colorscheme manager (also configures ~/.vimrc_background)
    if [[ ! -d ~/.config/base16-shell/.git ]]; then
      git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
    else
      echo "Base16 Shell already installed"
    fi
}

# Run :PluginInstall in Vim after running this function
# NOTE: must have 'vim' package installed; vim-tiny and vim-common (usual 20.04
#       package installs) don't work with ":PluginInstall"
install_vim_vundle() {
    if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
      git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else
      echo "Vundle already installed"
    fi
}

# PLACEHOLDER function: didn't have time to figure out where to store the
# Chrome profile icons b/c didn't want to store them in git; in the future,
# when I have storage for them I can use this method to deploy them
#
# The .gifs I have been using are my Gmail profile pics (hence -gmail.gif)
copy_chrome_icons() {
  for i in mm mackey
  do
    img_filename=chrome_${i}_profile-gmail.gif
    cp $img_filename ~/.local/share/applications/$img_filename
  done
}

install_tmux_plugin_manager() {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

setup_ssh_dirs() {
  mkdir -p ~/.ssh/config.d
}

create_vim_undo_dir() {
  mkdir -p ~/.vim/tmp/undo
}

compile_vim_youcompleteme() {
  cd ~/.vim/bundle/YouCompleteMe
  python3 install.py --all
}

#install_base16_shell
#install_vim_vundle
#install_tmux_plugin_manager
#compile_vim_youcompleteme
create_vim_undo_dir
#setup_ssh_dirs

