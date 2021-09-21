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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
"Plug 'airblade/vim-rooter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"--------------------------------
" Colors / Themes
"--------------------------------
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"--------------------------------
" Development-related
"--------------------------------
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
endif

"  --- Languages ---
" Opted-out of `vim-polygot; see link below for reasoning that I agreed with:
"   - https://www.barbarianmeetscoding.com/blog/polyglot-programming-in-vim#1-syntax-highlighting

" golang
Plug 'fatih/vim-go'

" HCL
" Not specifically a vim-plug plugin
Plug 'jvirtanen/vim-hcl'

" javascript/typescript/jsx/tsx
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'

" web development
Plug 'mattn/emmet-vim'


" call plug#end() to update &runtimepath and initialize plugin system
" Automatically executes filetype plugin indent on and syntax enable.
call plug#end()

