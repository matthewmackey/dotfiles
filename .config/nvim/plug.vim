let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin(data_dir . '/../plugged')

  " Colors
  Plug 'chriskempson/base16-vim'

  " General
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

  " Text Objects
  Plug 'wellle/targets.vim'

  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-fold'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'coachshea/vim-textobj-markdown'
  Plug 'bps/vim-textobj-python'

  " Languages
  " Plug 'Chiel92/vim-autoformat'
  Plug 'dense-analysis/ale'

if has('nvim')
  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'

  " File Explore
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'

  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " Lualine
  Plug 'nvim-lualine/lualine.nvim'
endif

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
