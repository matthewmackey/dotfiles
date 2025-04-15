let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-------------------------------------------------------------------------------
" vim-plug Section {{{
"-------------------------------------------------------------------------------
" Specify a directory for plugins
call plug#begin(data_dir . '/../plugged')
  " TODO: do I want this?
  " Plug 'vim-syntastic/syntastic'

  " Colors
  " The RRethy plugin seems to work better w/ lualine plugin then then the chriskempson one
  " Plug 'chriskempson/base16-vim'
  Plug 'RRethy/nvim-base16'

  " General
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'cohama/lexima.vim'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  " https://github.com/svermeulen/vim-easyclip.git
  " https://github.com/glts/vim-radical.git

  " Text Objects
  Plug 'wellle/targets.vim'

  " vim-textobj-user is the root plugin that allows the other `vim-textobj-*` plugins to work
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-entire'
  Plug 'kana/vim-textobj-fold'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'deathlyfrantic/vim-textobj-blanklines'
  Plug 'fvictorio/vim-textobj-backticks'
  Plug 'Julian/vim-textobj-brace'
  Plug 'thinca/vim-textobj-between'
  " Language-specific
  Plug 'bps/vim-textobj-python'
  Plug 'coachshea/vim-textobj-markdown'

  " Tag bar
  Plug 'liuchengxu/vista.vim'

  " Wiki
  Plug 'vimwiki/vimwiki'

  "------------------------------------------------------------
  " Languages - Generic
  "------------------------------------------------------------
  Plug 'dense-analysis/ale'
  Plug 'vim-test/vim-test' " Generic test framework

  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

  "------------------------------------------------------------
  " Languages - HTML
  "------------------------------------------------------------
  Plug 'mattn/emmet-vim'
  Plug 'https://github.com/digitaltoad/vim-pug.git'

  "------------------------------------------------------------
  " Languages - Go
  "------------------------------------------------------------
  Plug 'fatih/vim-go'
  Plug 'AndrewRadev/splitjoin.vim'

  "------------------------------------------------------------
  " Languages - Kotlin
  "------------------------------------------------------------
  Plug 'udalov/kotlin-vim'

  "-------------------------------------------------------------------------------
  " nvim-specific Plugins {{{
  "-------------------------------------------------------------------------------
  if has('nvim')
    " Colors
    Plug 'lukas-reineke/indent-blankline.nvim'

    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', { 'tag': 'v0.8.0', 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/playground'

    " Completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'

    " Snippets (w/ completion integration)
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'

    " File Explore
    Plug 'kyazdani42/nvim-web-devicons' " for file icons

    " nvim-tree.lua unfortunately does not have any tags besides `nightly` so I
    " just picked a random commit that was a bit before the latest commit on
    " 1/31/2023 to help resolve issues I was seeing when updating to the latest commit
    Plug 'kyazdani42/nvim-tree.lua', { 'commit': '3c4958ab3dd0e5fa470fb50b6b9cc6df48229a2e' }

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'nvim-telescope/telescope-fzf-writer.nvim'

    " Lualine
    Plug 'nvim-lualine/lualine.nvim'

    " Look/Feel
    " Must have 'pynvim' on PATH when running PlugInstall for this plugin
    Plug 'TaDaa/vimade'
  endif

"   }}} nvim-specific Plugins

" }}} - vim-plug


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

" vim: ft=vim foldmarker={{{,}}} foldmethod=marker foldlevel=100
