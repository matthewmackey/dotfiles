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
Plug '907th/vim-auto-save'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'

"--------------------------------
" Colors / Themes
"--------------------------------
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'| Plug 'vim-airline/vim-airline-themes'

"--------------------------------
" Git-related
"--------------------------------
Plug 'tpope/vim-fugitive'

"--------------------------------
" Development-related
"--------------------------------
Plug 'fatih/vim-go'

"--------------------------------
" Tim Pope Plugins
"--------------------------------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" call plug#end() to update &runtimepath and initialize plugin system
" Automatically executes filetype plugin indent on and syntax enable.
call plug#end()

