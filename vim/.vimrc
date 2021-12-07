"-------------------------------------------------------------------------------
" NOTES {{{
"-------------------------------------------------------------------------------
" See:
"   - https://github.com/bluz71/dotfiles
"   - https://github.com/nathunsmitty/.config/blob/main/nvim/init.vim
"
" Things I can't remember from Help Pages:
"
"--------------------------------
" Ex-mode w/ command-line window
" From: Vim Help Pages
"--------------------------------
" OPEN						*c_CTRL-F* *q:* *q/* *q?*

" There are two ways to open the command-line window:
" 1. From Command-line mode, use the key specified with the 'cedit' option.
"    The default is CTRL-F when 'compatible' is not set.
" 2. From Normal mode, use the "q:", "q/" or "q?" command.
"    This starts editing an Ex command-line ("q:") or search string ("q/" or
"   "q?").  Note that this is not possible while recording is in progress (the
"   "q" stops recording then).
" }}} Notes


"-------------------------------------------------------------------------------
" GENERAL Settings {{{
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
set cursorline                " Do not highlight line cursor is on (speeds up highlighting)
set encoding=utf8             " UTF-8 encoding and en_US as default encoding/language
set ffs=unix,dos,mac          " Define standard filetype
set hidden                    " Buffer should still exist if window is closed
set lazyredraw                " Wait to redraw
set mouse=a                   " Allow mouse to move cursor
set number                  " Show line numbers
set relativenumber          " Show relative line numbers
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
" }}} General Settings


"-------------------------------------------------------------------------------
"               CLIPBOARD Settings {{{
"
" From - https://vim.fandom.com/wiki/Highlight_unwanted_spaces
" From - https://stackoverflow.com/a/30691754/14209903
"-------------------------------------------------------------------------------
"set clipboard^=unnamed,unnamedplus

" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
"if has('unnamedplus')
  "set clipboard^=unnamed
  "set clipboard^=unnamedplus
"endif
" }}} Clipboard


"-------------------------------------------------------------------------------
"               WHITESPACE Settings {{{
"
" From - https://vim.fandom.com/wiki/Highlight_unwanted_spaces
"-------------------------------------------------------------------------------
" Don't mark special characters (from 'listchars')
set nolist

set listchars=eol:$,extends:>,nbsp:.,precedes:<,space:.,tab:>-,trail:~

highlight ExtraWhitespace ctermbg=blue guibg=blue
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=blue guibg=blue

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}} Whitespace


"-------------------------------------------------------------------------------
"               TERMINAL Settings {{{
"-------------------------------------------------------------------------------
" From: https://github.com/bluz71/dotfiles/blob/master/vim/custom/terminal.vim
" Note, the following settings are for terminal Vim only. Neovim and GUI Vim do
" not require these settings.
"
if !has('gui_running') && !has('nvim')
    set term=xterm-256color " Vim does not like TERM=alacritty
    set ttyfast             " Indicate fast terminal conn for faster redraw
    set ttymouse=xterm2     " Indicate terminal type for mouse codes
    set ttyscroll=3         " Speedup scrolling
    " if tmux
    if &term ==# 'tmux-256color'
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        " Make Vim *set termguicolors* work inside tmux.
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " else not tmux
    else
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
    endif
endif
" }}} Terminal


"-------------------------------------------------------------------------------
"               AUTOCOMMANDS Settings {{{
" See :
"  https://github.com/bluz71/dotfiles/blob/master/vim/custom/autocmds.vim
"-------------------------------------------------------------------------------
augroup MmCustomEvents
  " Note, 'autocmd!' is used to clear out any existing definitions in this
  " auto-group. This prevents duplicate entries upon a live ~/.vimrc reload
  autocmd!

  " Close Vim if NERDTree is only window still open
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup END
" }}} Autocmds


"-------------------------------------------------------------------------------
"               KEYMAPPINGS Settings {{{
"-------------------------------------------------------------------------------
"-----------------------------------------
" Keymaps - General {{{
"-----------------------------------------
" Change the mapleader from '\' to ','
let mapleader=","
nnoremap <Space> <nop>
let mapleader=" "

nnoremap ; :
nnoremap : <nop>
nnoremap <Leader>w :wq<CR>
nnoremap <Leader>q :q!<CR>

nnoremap <Leader>: q:i
nnoremap <Leader>/ q/i

imap jj <Esc>

" Terminal Mode - Escape Key
if has('nvim')
  " Not using <Esc> b/c I need that for Bash's vim-mode
  tnoremap <C-Space>    <C-\><C-n>

  " Exit terminal mode then switch tabs
  tnoremap <C-PageDown> <C-\><C-n> :tabnext<CR>
  tnoremap <C-PageUp>   <C-\><C-n> :tabprevious<CR>
endif

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>ps :PlugStatus<CR>

" Remap `:help` in command-mode to `:tab help`
" See: https://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit/7515418#7515418
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" _ = forward slash
nnoremap <Leader>_ :source ~/.vimrc<CR>

nnoremap <Leader>2 :set invpaste<CR>
nnoremap <F2>      :set invpaste<CR>

nnoremap <Leader>3 :windo set norelativenumber! nonu!<Cr>
nnoremap <F3>      :windo set norelativenumber! nonu!<Cr>

nnoremap <Leader>4 :set list!<CR>
nnoremap <F4>      :set list!<CR>

" Mainly used to close window when only NERDTree is open
nnoremap <Leader>q :wqa<CR>
"   }}} Keymaps - General

"----------------------------------------------------------------"
" Keymaps - Windows {{{
"----------------------------------------------------------------"
" Switch between different windows by their direction in ANY mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h

tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h

" Maximize window all directions
noremap <silent> <Leader>z :resize 99999<CR>:vertical resize 99999<CR>

" noremap <silent> <Leader>ww :vertical resize 99999<CR> " Maximize window horizontally ("my horizontal")
" noremap <silent> <Leader>wv <C-w>_                     " Maximize window vertically ("my vertical")
noremap          <Leader>= <C-w>=                      " Make windows all equal size

nnoremap <silent> <Leader>n :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>m :exe "vertical resize -10"<CR>
"   }}} Keymaps - Windows

"----------------------------------------------------------------"
" Keymaps - Other {{{
"----------------------------------------------------------------"
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" IDE: Enable folding with spacebar
nnoremap , za
"   }}} Keymaps - Other

"----------------------------------------------------------------"
" Keymaps - Tabs {{{
"----------------------------------------------------------------"
" From - https://vim.fandom.com/wiki/Alternative_tab_navigation#Vim_navigation_2
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>

" tabnew & tabedit are actually same command, but I'm using tabedit when I
" want to select file to open
"
" Open a new tab w/ empty window after curr tab
nnoremap <Leader>tn  :tabnew<CR>

" Open a new tab & edit {file} after curr tab
nnoremap <Leader>tt  :tabedit<Space>

" Close current tab
nnoremap <Leader>x   :tabclose<CR>
nnoremap <Leader>tx  :tabclose<CR>

" Move the current tab page to after tab page N
nnoremap <Leader>tm  :tabmove<Space>

" Move the tab page to the left
nnoremap <Leader><< :tabmove -1<CR>
"
" Move the tab page to the left
nnoremap <Leader>>> :tabmove +1<CR>

" UPDATE 5/12/2021 - this seems to work now for tab switching
"
" Couldn't get <C-PageUp/Down> to work even after I disabled those keybindings
" in my terminal settings "Edit -> Preferences -> Shortcuts'
" See here for some info:
"   https://stackoverflow.com/questions/1814373/why-do-c-pageup-and-c-pagedown-not-work-in-vim
nnoremap <C-PageUp>   :tabprev<CR>
nnoremap <C-PageDown> :tabnext<CR>

" Go to prev tab page; wraps around from 1st to last
" (can't use HJKL alone because I need those standard Vim bindings))
nnoremap <Leader>;   :tabprev<CR>
nnoremap <Leader>H   :tabprev<CR>
nnoremap <Leader>P   :tabprev<CR>

" Go to next tab page; wraps around from last to 1st
nnoremap <Leader>.   :tabnext<CR>
nnoremap <Leader>L   :tabnext<CR>
nnoremap <Leader>N   :tabnext<CR>

" Go to 1st tab
nnoremap <Leader>th  :tabfirst<CR>

" Go to last tab
nnoremap <Leader>tl  :tablast<CR>

" Go to exact tab number (tabs are 1-indexed)
nnoremap <Leader>t1   :tabnext 1<CR>
nnoremap <Leader>t2   :tabnext 2<CR>
nnoremap <Leader>t3   :tabnext 3<CR>
nnoremap <Leader>t4   :tabnext 4<CR>
nnoremap <Leader>t5   :tabnext 5<CR>

" Go to last 'active' tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nnoremap <Leader><Space> :exe "tabnext ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
"   }}} Keymaps - Tabs

"----------------------------------------------------------------"
" Keymaps - Completions {{{
"
" See: https://github.com/bluz71/dotfiles/blob/master/vim/custom/mappings.vim#L220
"----------------------------------------------------------------"
"   l     - whole line completion (repeat an existing line)
"   n     - keyword completion (forward)
"   p     - keyword completion (backward)
"   d     - dictionary completion (via 'dictionary' setting)
"   f     - file path completion
"   ]     - 'tags' file completion
"   Space - context aware omni completion (via 'omnifunc' setting)
inoremap <C-l>     <C-x><C-l>
inoremap <C-n>     <C-x><C-n>
inoremap <C-p>     <C-x><C-p>
inoremap <C-d>     <C-x><C-k>
inoremap <C-f>     <C-x><C-f>
inoremap <C-]>     <C-x><C-]>
inoremap <C-Space> <C-x><C-o>

"   }}} Keymappings - Completions

" }}} Keymappings


"-------------------------------------------------------------------------------
"               FUNCTIONS Settings {{{
"-------------------------------------------------------------------------------
"----------------------------------------------------------
" Functions to show syntax group(s) for char under cursor
"----------------------------------------------------------
" See: https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

function! MmSynUnderCursor()
  echo "SynGroup:\n"
  call SynGroup()
  echo "\nSynStack:\n"
  call SynStack()
endfunction

map <Leader>s :call MmSynUnderCursor()<CR>

"-------------------------------------------------------
" Functions to select from a set of vim-airline themes
"-------------------------------------------------------
" See theme screenshots here:
"   https://github.com/vim-airline/vim-airline/wiki/Screenshots

"--------------------------
" DEFAULT Airline Theme
"--------------------------
let g:airline_theme = 'papercolor'

let g:mm_airline_themes = ['dark', 'light', 'murmur', 'papercolor', 'solarized']
let g:mm_airline_themes_current_index = 0

function ListMmAirlineThemes()
  echo 'Available "mm" themes: '
  let l:i = 0
  for l:theme in g:mm_airline_themes
   echo l:i . ': ' . g:mm_airline_themes[l:i]
   let l:i += 1
  endfor
endfunction

function SelectMmAirlineTheme(airline_theme_index)
  let l:curr_theme = g:mm_airline_themes[g:mm_airline_themes_current_index]

  "echo 'index provided: [' a:airline_theme_index . ']'
  let l:len_airline_themes = len(g:mm_airline_themes)
  if a:airline_theme_index >= l:len_airline_themes
    echo 'Invalid index provided: [' a:airline_theme_index . ']'
    echo "\n"
    :call ListMmAirlineThemes()
    return 1
  endif

  let next_theme = g:mm_airline_themes[a:airline_theme_index]

  execute  'AirlineTheme ' . l:next_theme
  echo 'Changed theme from [' . l:curr_theme . '] -> [' . l:next_theme . ']'
endfunction

function NextMmAirlineTheme(...)
  if a:0 > 0
    let l:theme_index_increment = a:1
  else
    let l:theme_index_increment = 1
  endif
  "echo 'increment -> ' . l:theme_index_increment
  "echo 'len(airline_themes) -> [' .  len(g:mm_airline_themes) . ']'
  "echo 'curr_index -> [' . g:mm_airline_themes_current_index . ']'
  "echo 'curr_index + 1 -> [' . (g:mm_airline_themes_current_index + 1) . ']'
  "echo '((curr_index + 1) % length) -> [' . ( ((g:mm_airline_themes_current_index + 1) % len(g:mm_airline_themes)) ) . ']'

  let l:next_theme_index = ((g:mm_airline_themes_current_index + l:theme_index_increment) % len(g:mm_airline_themes))
  if l:next_theme_index == -1
      let l:next_theme_index = 0
      "echo 'next_theme_index was -1; setting index to 0'
  endif
  "echo 'next_theme_index -> [' . l:next_theme_index . ']'

  let l:curr_theme = g:mm_airline_themes[g:mm_airline_themes_current_index]
  "echo 'curr_theme -> [' . l:curr_theme . ']'

  let g:mm_airline_themes_current_index = l:next_theme_index
  "echo 'next_curr_index -> [' . g:mm_airline_themes_current_index . ']'

  let next_theme = g:mm_airline_themes[g:mm_airline_themes_current_index]
  "echo 'next_theme -> [' . l:next_theme . ']'
  execute  'AirlineTheme ' . l:next_theme
  echo 'Changed theme from [' . l:curr_theme . '] -> [' . l:next_theme . ']'
endfunction

function PrevMmAirlineTheme()
  :call NextMmAirlineTheme(-1)
endfunction

" It is recommended to use a 'command' instead of 'input()'
" See :
"  - https://vi.stackexchange.com/questions/20760/how-to-add-a-count-to-a-binding
"  - https://vi.stackexchange.com/questions/4753/is-it-possible-to-create-mappings-with-parameters
command! -nargs=1 SelectMmAirlineTheme :call SelectMmAirlineTheme(<q-args>)
nnoremap <Leader>hs :<C-u>call SelectMmAirlineTheme(v:count)<CR>

nnoremap <Leader>hl :call ListMmAirlineThemes()<CR>
nnoremap <Leader>hn :call NextMmAirlineTheme()<CR>
nnoremap <Leader>hp :call PrevMmAirlineTheme()<CR>

" }}} Functions


"-------------------------------------------------------------------------------
"               PLUGIN Settings {{{
"
"   Configs -> auto-sourced via: ~/dotfiles/vim/plugin/*
"-------------------------------------------------------------------------------
runtime config/plugins.vim
" }}} Plugins


"-------------------------------------------------------------------------------
"               LSP Config Settings {{{
"-------------------------------------------------------------------------------
runtime config/lsp.vim
" }}} LSP Config


"-------------------------------------------------------------------------------
"               COLORS Settings {{{
"-------------------------------------------------------------------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Color Scheme                                     "
"                                                                              "
" base16-shell creates Vim colorscheme file at ~/.vimrc_background             "
"                                                                              "
" From - https://github.com/chriskempson/base16-shell                          "
" From - https://csswizardry.com/2017/03/configuring-git-and-vim/              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" 1st test: naive test to see if base16-vim is installed to avoid error message
"           on 1st vim startup before plugins installed the 1st time
if filereadable(expand("~/.vim/plugged/base16-vim/colors/base16-seti.vim"))
      \ && filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  set background=light
  source ~/.vimrc_background
endif

" Must be after sourcing ~/.vimrc_background to override for all colorschemes
" highlight ColorColumn ctermbg=None cterm=underline
highlight ColorColumn ctermbg=DarkGray

" Toggle the colorcolumn on/off
"
" WARNING: doesn't seem to work in PASTE mode
"
" NOTE - the +1 sets colorcolumn to +1 of current textwidth value;
"        the normal textwidth set in the general settings is 80
noremap <Leader>5 :windo exec (&colorcolumn == '0' ? ':set colorcolumn=+1' : ':set colorcolumn=0')<CR>

" Underline anything over '&colorcolumn'
" SEE: link below; need '2match' to allow ExtraWhitespace & OverLength matches
"   - https://unix.stackexchange.com/questions/139466/highlight-extra-white-spaces-and-fixed-length-column-in-vim
highlight OverLength cterm=underline
autocmd BufWinEnter * execute '2match OverLength /\%>' . &textwidth . 'v.\+/'
autocmd InsertEnter * execute '2match OverLength /\%>' . &textwidth . 'v.\+/'
autocmd InsertLeave * execute '2match OverLength /\%>' . &textwidth . 'v.\+/'
autocmd BufWinLeave * call clearmatches()

"---------------------"
"   Git with Vim      "
"---------------------"
" Colour the 73rd column so that we don’t type over our limit
autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

" Turn off colorcolumn to start for all other files
set colorcolumn=0
" }}} Colors


"----------------------------------------------
" Local-overrides
"----------------------------------------------
runtime .vimrc-local



" vim: ft=vim foldmarker={{{,}}} foldmethod=marker foldlevel=0
