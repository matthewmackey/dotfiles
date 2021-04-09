"-------------------------------------------------------------------------------
" GENERAL Settings
"-------------------------------------------------------------------------------

" DISABLE python provider support until I get my installed Pythons reconfigured
" See: https://neovim.io/doc/user/provider.html#provider-python
if has('nvim')
  let g:loaded_python_provider = 0
  let g:loaded_python3_provider = 0
endif

set nocompatible                " Enables us Vim specific features

set autoread                    " Automatically read changed files
set autowrite                 " Used by 'go-vim' via ':make' hook
set backspace=indent,eol,start " modern backspace behavior
set cmdheight=1               " Height of the command bar
set nocursorcolumn              " Do not highlight column cursor is on(speeds up highlighting)
set nocursorline                " Do not highlight line cursor is on (speeds up highlighting)
set encoding=utf8             " UTF-8 encoding and en_US as default encoding/language
set ffs=unix,dos,mac          " Define standard filetype
set foldmethod=marker
set foldmarker={{,}}
set hidden                    " Buffer should still exist if window is closed
set lazyredraw                " Wait to redraw
set mouse=a                   " Allow mouse to move cursor
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set ruler                     " always show current position
set showcmd                   " show last command in the bottom right
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set textwidth=80                 " Force the cursor onto a new line after 80 characters

" Backup/Swap files
set nobackup                  " Remove backup file after file is successfully overwritten
set noswapfile                " Don't create swap files
set writebackup               " Make a backup before overwriting a file

" Menus
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set wildmenu                  " visual autocomplete for command menu

" Searching
set incsearch                   " Shows the match while typing
set nohlsearch                    " Highlight found searches
"set ignorecase                  " Search case insensitive...
"set smartcase                   " ... but not it begins with upper case

" Text & Indentation
set expandtab                    " Use spaces, no tabs
set shiftwidth=2                 " # of spaces to use for each indent
set softtabstop=2                " # of spaces <Tab> counts for when insert <Tab> or use <BS>
set autoindent                   " Copy indent from current line when starting a new line
set nosmartindent                " Smart indent OFF (b/c using `filetype plugin indent`)
set smarttab                     " Use smart tabs

" Remap `:help` in command-mode to `:tab help`
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" Persistent undo
let s:tmp_undodir = $HOME . '/.vim/tmp/undo'
if has('persistent_undo')
  if !isdirectory(s:tmp_undodir)
    call mkdir(s:tmp_undodir, 'p')
    display 'Created undo directory at: ' . s:tmp_undodir
  endif
  set undofile
  let &undodir=s:tmp_undodir
endif

"----------------------------------------------------------------"
"               Whitespace Handling                              "
"
" From - https://vim.fandom.com/wiki/Highlight_unwanted_spaces   "
"----------------------------------------------------------------"
" Don't mark special characters (from 'listchars'))
set nolist

set listchars=eol:$,extends:>,nbsp:.,precedes:<,space:.,tab:>-,trail:~

highlight ExtraWhitespace ctermbg=blue guibg=blue
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=blue guibg=blue

match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

"----------------------------------------------------------------"
"               Clipboard                                        "
"                                                                "
" From - https://vim.fandom.com/wiki/Highlight_unwanted_spaces   "
" From - https://stackoverflow.com/a/30691754/14209903           "
"----------------------------------------------------------------"
"set clipboard^=unnamed,unnamedplus

" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
"if has('unnamedplus')
  "set clipboard^=unnamed
  "set clipboard^=unnamedplus
"endif


"----------------------------------------------
" INCLUDE: Terminal Settings
"----------------------------------------------
runtime custom/terminal.vim


"----------------------------------------------
" INCLUDE: Key Mappings
"----------------------------------------------
runtime custom/keymappings.vim


"----------------------------------------------
" INCLUDE: Functions
"----------------------------------------------
runtime custom/functions.vim


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


"----------------------------------------------
" PLUGIN CONFIGS
"----------------------------------------------
" Automatically sourced via: ~/dotfiles/vim/plugin/*


"----------------------------------------------
" COLORS
"----------------------------------------------
runtime custom/colors.vim

