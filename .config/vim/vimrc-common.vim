"-------------------------------------------------------------------------------
" GENERAL Settings {{{
"-------------------------------------------------------------------------------
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
set scrolloff=8
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set textwidth=80                 " Force the cursor onto a new line after 80 characters

" Backup/Swap files
set nobackup                  " Remove backup file after file is successfully overwritten
set noswapfile                " Don't create swap files
set writebackup               " Make a backup before overwriting a file

" Folding
" set foldmethod=indent
set foldmethod=marker
set foldmarker={{{,}}}
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
" }}} General Settings


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

nnoremap <Leader>pc :PlugClean<CR>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>ps :PlugStatus<CR>

" Remap `:help` in command-mode to `:tab help`
" See: https://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit/7515418#7515418
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" _ = forward slash
nnoremap .. :source ~/.config/nvim/init.vim<CR>
nnoremap .c :tabedit ~/.config/vim/vimrc-common.vim<CR>

nnoremap <Leader>2 :set invpaste<CR>
nnoremap <F2>      :set invpaste<CR>

nnoremap <Leader>3 :windo set norelativenumber! nonu!<Cr>
nnoremap <F3>      :windo set norelativenumber! nonu!<Cr>

nnoremap <Leader>4 :set list!<CR>
nnoremap <F4>      :set list!<CR>

" Mainly used to close window when only NERDTree is open
nnoremap <Leader>q :wqa<CR>
" }}} Keymaps - General

"----------------------------------------------------------------"
" Keymaps - Buffers {{{
"----------------------------------------------------------------"
nnoremap <Leader>a  <C-^>
nnoremap <Leader>l  :buffers<CR>
nnoremap <Leader>bb :buffers<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bl :blast<CR>

" }}} Keymaps - Buffers

"----------------------------------------------------------------"
" Keymaps - Windows {{{
"----------------------------------------------------------------"
" Switch between different windows by their direction in ANY mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
" inoremap <C-h> <C-\><C-N><C-w>h

" Terminal-mode
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h

" Maximize window all directions
noremap <silent> <Leader>z :resize 99999<CR>:vertical resize 99999<CR>

" noremap <silent> <Leader>ww :vertical resize 99999<CR> " Maximize window horizontally ("my horizontal")
" noremap <silent> <Leader>wv <C-w>_                     " Maximize window vertically ("my vertical")
noremap <Leader>= <C-w>=                      " Make windows all equal size

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
nnoremap J mzJ`z

nnoremap zj zjzz
nnoremap zk zkzz

" Add undo break points for various punctuation
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Add any j/k movements over 5 lines to jumplist (not normally recorded)
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

" Text movements (that preserve prior indentation)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <Esc>:m .+1<CR>==i
inoremap <C-k> <Esc>:m .-2<CR>==i
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==

" Maintain visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Act like D and C
nnoremap Y y$

" IDE: Enable folding with spacebar
nnoremap , za


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
nnoremap <Leader>tt  :tabedit<CR>

" Close current tab
nnoremap <Leader>x   :tabclose<CnitR>
nnoremap <Leader>tx  :tabclose<CR>

" Move the current tab page to after tab page N
nnoremap <Leader>tm  :tabmove<Space>

" Move the tab page to the left
nnoremap <Leader><< :tabmove -1<CR>
"
" Move the tab page to the left
nnoremap <Leader>>> :tabmove +1<CR>

nnoremap <Leader>;   :tabprev<CR>
nnoremap <Leader>.   :tabnext<CR>
nnoremap <Leader>th  :tabfirst<CR>
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


" vim: ft=vim foldmarker={{{,}}} foldmethod=marker foldlevel=0
