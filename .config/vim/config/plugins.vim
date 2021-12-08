""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      vim-plug - Plugin Manager                                     "
"                                                                                    "
" EXCELLENT: https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html             "
" EXCELLENT: https://bluz71.github.io/2019/10/16/lsp-in-vim-with-the-lsc-plugin.html "
"                                                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')


"------------------------------------------------------------------"
"                   General - Utilities
"------------------------------------------------------------------"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
"Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"--------------------------------
" IDE-related
"--------------------------------
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

"--------------------------------
" Colors / Themes
"--------------------------------
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"------------------------------------------------------------------"
"               GENERAL - Development-related
"------------------------------------------------------------------"
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

" General Syntax Checking plugin - uses external tools for checking
" Plug 'vim-syntastic/syntastic'


"  --- Languages ---
" Opted-out of `vim-polygot; see link below for reasoning that I agreed with:
"   - https://www.barbarianmeetscoding.com/blog/polyglot-programming-in-vim#1-syntax-highlighting

"---------------------------------------------"
" Go
"---------------------------------------------"
Plug 'fatih/vim-go'

" Go
" Not specifically a vim-plug plugin
Plug 'jvirtanen/vim-hcl'

"---------------------------------------------"
" javascript/typescript/jsx/tsx
"---------------------------------------------"
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'

"---------------------------------------------"
" Python
"---------------------------------------------"
" Plug 'tmhedberg/SimpylFold'    " Python-specific folding
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'nvie/vim-flake8'

" Run after install:
"  cd ~/.vim/plugged/jedi-vim; git submodule update --init --recursive
" Plug 'davidhalter/jedi-vim'

" Plug 'dense-analysis/ale'

"---------------------------------------------"
" Web
"---------------------------------------------"
Plug 'mattn/emmet-vim'


" call plug#end() to update &runtimepath and initialize plugin system
" Automatically executes filetype plugin indent on and syntax enable.
call plug#end()

" let g:ale_linters = {
"     \   'python': ['flake8', 'pylint'],
"     \   'javascript': ['eslint'],
"     \}
" let g:ale_fixers = {
"     \    'python': ['autoflake'],
"     \}
