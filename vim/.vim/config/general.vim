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
set hidden                    " Buffer should still exist if window is closed
set lazyredraw                " Wait to redraw
set mouse=a                   " Allow mouse to move cursor
set nonumber                  " Show line numbers
set norelativenumber          " Show relative line numbers
set ruler                     " always show current position
set showcmd                   " show last command in the bottom right
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set nospell                   " Turn off spell check
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set textwidth=80                 " Force the cursor onto a new line after 80 characters

" Backup/Swap files
set nobackup                  " Remove backup file after file is successfully overwritten
set noswapfile                " Don't create swap files
set writebackup               " Make a backup before overwriting a file

" Folding
set foldmethod=indent
" set foldmethod=marker
" set foldmarker={{,}}
set foldlevelstart=99         " All folds open to start


" Menus
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set wildmenu                  " visual autocomplete for command menu

" Searching
set incsearch                   " Shows the match while typing
set nohlsearch                    " Highlight found searches
"set ignorecase                  " Search case insensitive...
"set smartcase                   " ... but not it begins with upper case

" FROM help:
" If you don't want to turn 'hlsearch' on, but want to highlight all
" matches while searching, you can turn on and off 'hlsearch' with
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Text & Indentation
set expandtab                    " Use spaces, no tabs
set shiftwidth=2                 " # of spaces to use for each indent
set softtabstop=2                " # of spaces <Tab> counts for when insert <Tab> or use <BS>
set autoindent                   " Copy indent from current line when starting a new line
set nosmartindent                " Smart indent OFF (b/c using `filetype plugin indent`)
set smarttab                     " Use smart tabs

" Remap `:help` in command-mode to `:tab help`
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" Change working directory of window to be the directory of current file anytime
" we change windows (ie - each window has a workdir of where its file resides)
"
" 'When a |:lcd| command has been used for a window, the specified directory
" becomes the current directory for that window.  Windows where the |:lcd|
" command has not been used stick to the global or tab-local current directory.'
autocmd BufEnter * silent! lcd %:p:h

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

