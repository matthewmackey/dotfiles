"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      vim-plug - Plugin Manager                               "
"                                                                              "
" EXCELLENT: https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html       "
" EXCELLENT: https://bluz71.github.io/2019/10/16/lsp-in-vim-with-the-lsc-plugin.html
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"--------------------------------
" General - Utilities
"--------------------------------
Plug 'scrooloose/nerdtree'

"--------------------------------
" Colors / Themes
"--------------------------------
Plug 'chriskempson/base16-vim'

"--------------------------------
" Development-related
"--------------------------------
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
endif

" call plug#end() to update &runtimepath and initialize plugin system
" Automatically executes filetype plugin indent on and syntax enable.
call plug#end()

