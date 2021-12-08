let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin(data_dir . '/plugged')

  Plug 'chriskempson/base16-vim'


  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'cohama/lexima.vim'
  " https://github.com/svermeulen/vim-easyclip.git
  " https://github.com/glts/vim-radical.git

  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'PhilRunninger/nerdtree-visual-selection'

if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
  " Plug 'hrsh7th/nvim-compe'

  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Plug 'vim-syntastic/syntastic'


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

" vim: ft=vim
