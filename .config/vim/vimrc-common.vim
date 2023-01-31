"-------------------------------------------------------------------------------
" GENERAL Settings {{{
"-------------------------------------------------------------------------------
set nocompatible                " Enables us Vim specific features

set autoread                    " Automatically read changed files
" set autowrite                 " Used by 'go-vim' to save before Vim's ':make' hook
set backspace=indent,eol,start " modern backspace behavior
set cmdheight=1               " Height of the command bar
set nocursorcolumn              " Do not highlight column cursor is on(speeds up highlighting)
set cursorline                " Do not highlight line cursor is on (speeds up highlighting)
set encoding=utf8             " UTF-8 encoding and en_US as default encoding/language
set ffs=unix,dos,mac          " Define standard filetype
set nohidden                    " Buffer should not still exist if window is closed
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
set virtualedit=all           " Allow moving columns passed the last character on a line

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
" Change the mapleader from '\' to '<Space>'
"
" SEE: https://stackoverflow.com/questions/446269/can-i-use-space-as-mapleader-in-vim
nnoremap <Space> <nop>
let mapleader=" "
" let mapleader=","

nnoremap <leader>so :so %<cr>

nnoremap ; :
nnoremap : <nop>
nnoremap <leader>w :wq<cr>
nnoremap <leader>q :q!<cr>

nnoremap <leader>: q:i
nnoremap <leader>/ q/i

" Leave insert mode w/ `jj`
imap jj <Esc>

nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>ps :PlugStatus<cr>

" Remap `:help` in command-mode to `:tab help`
" See: https://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit/7515418#7515418
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" _ = forward slash
nnoremap .. :source ~/.config/nvim/init.vim<cr>
nnoremap .c :tabedit ~/.config/vim/vimrc-common.vim<cr>

nnoremap <leader>2 :set invpaste<cr>
nnoremap <leader>3 :windo set norelativenumber! nonu!<cr>
nnoremap <leader>4 :set list!<cr>

" Mainly used to close window when only NERDTree is open
nnoremap <leader>q :wqa<cr>

" Make all copy/pastes go to System clipboard (`unnamedplus` is what Ubuntu uses for system clipboard)
"
" NOT USING the "automatic" coyp/paste method of using `set clipboard=unnamedplus` b/c with that
" method, if you have something copied to the system clipboard and want to paste it in Vim, but
" you have already done a yank in Vim, then that yank will have overwritten what you wanted to copy
" from the system clipboard.  Then you have to open Parcellite again to
" highlight what you originally wanted to copy, which is a pain.
"
" Therefore, I think having explicit keybindings for interacting with the system clipboard is preferred.
"
" Also, I am using capitalzed "p" in the `<leader>P` paste keybinding b/c the paste is really
" slow if you do a lowercase `<leader>p` b/c there are other keybindings with `<leader>p*`
" so it seems Vim needs to wait to see if you are going to press the 2nd letter after the `p`
"
" And for symmetry, I'm also making a capitalized yank keybinding (`<leader>Y`),
" even though I will probably use the lowercase yank one b/c it is both easier
" to type and fast b/c there are no `<leader>y*` keybindings currently.
"
" SEE: https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
"
" set clipboard=unnamedplus
noremap <leader>y "+y
noremap <leader>Y "+y
noremap <leader>P "+p

" }}} Keymaps - General

"----------------------------------------------------------------"
" Keymaps - Buffers {{{
"----------------------------------------------------------------"
nnoremap <leader>a  <C-^>
nnoremap <leader>l  :buffers<cr>
nnoremap <leader>bb :buffers<cr>
nnoremap <leader>bf :bfirst<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bl :blast<cr>

" }}} Keymaps - Buffers

"----------------------------------------------------------------"
" Keymaps - Windows {{{
"----------------------------------------------------------------"
" Switch between different windows by their direction in ANY mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Swap windows
nnoremap <C-x> <C-w>x

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
noremap <silent> <leader>z :resize 99999<cr>:vertical resize 99999<cr>

" noremap <silent> <leader>ww :vertical resize 99999<cr> " Maximize window horizontally ("my horizontal")
" noremap <silent> <leader>wv <C-w>_                     " Maximize window vertically ("my vertical")
noremap <leader>= <C-w>=                      " Make windows all equal size

nnoremap <silent> <leader>n :exe "vertical resize +10"<cr>
nnoremap <silent> <leader>m :exe "vertical resize -10"<cr>
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
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap <C-j> <Esc>:m .+1<cr>==i
inoremap <C-k> <Esc>:m .-2<cr>==i
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

" Maintain visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Act like D and C
nnoremap Y y$


"----------------------------------------------------------------"
" Keymaps - Tabs {{{
"----------------------------------------------------------------"
" From - https://vim.fandom.com/wiki/Alternative_tab_navigation#Vim_navigation_2
nnoremap <C-t>  :tabnew<cr>
inoremap <C-t>  <Esc>:tabnew<cr>

" tabnew & tabedit are actually same command, but I'm using tabedit when I
" want to select file to open
"
" Open a new tab w/ empty window after curr tab
nnoremap <leader>tn  :tabnew<cr>

" Open a new tab & edit {file} after curr tab
nnoremap <leader>tt  :tabedit<cr>

" Close current tab
nnoremap <leader>x   :tabclose<cr>
nnoremap <leader>tx  :tabclose<cr>

" Move the current tab page to after tab page N
nnoremap <leader>tm  :tabmove<Space>

" Move the tab page to the left
nnoremap <leader><< :tabmove -1<cr>
"
" Move the tab page to the left
nnoremap <leader>>> :tabmove +1<cr>

nnoremap <leader>;   :tabprev<cr>
nnoremap <leader>.   :tabnext<cr>
nnoremap <leader>th  :tabfirst<cr>
nnoremap <leader>tl  :tablast<cr>

" Go to exact tab number (tabs are 1-indexed)
nnoremap <leader>t1   :tabnext 1<cr>
nnoremap <leader>t2   :tabnext 2<cr>
nnoremap <leader>t3   :tabnext 3<cr>
nnoremap <leader>t4   :tabnext 4<cr>
nnoremap <leader>t5   :tabnext 5<cr>

" Go to last 'active' tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nnoremap <leader><Space> :exe "tabnext ".g:lasttab<cr>
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
noremap <leader>5 :windo exec (&colorcolumn == '0' ? ':set colorcolumn=+1' : ':set colorcolumn=0')<cr>

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


"-------------------------------------------------------------------------------
"               OTHER Settings {{{
"-------------------------------------------------------------------------------
let g:markdown_fenced_languages = ['css', 'go', 'js=javascript', 'json=javascript', 'python', 'ruby', 'sh', 'vim', 'xml']
" }}} Other


" vim: ft=vim foldmarker={{{,}}} foldmethod=marker foldlevel=0
