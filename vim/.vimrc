""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Vundler - Plugin Manager                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                   " Enables us Vim specific features (required by Vundler)
filetype off                       " Reset filetype detection first (required by Vundler)

set rtp+=~/.vim/bundle/Vundle.vim  " set the runtime path to include Vundle and initialize

call vundle#begin()                " All of your Plugins must be between vundle#begin/end

Plugin 'gmarik/Vundle.vim'         " let Vundle manage Vundle, required

Plugin 'chriskempson/base16-vim'
Plugin 'faith/vim-go'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Settings                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on       " Re-enable filetype detection

set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling

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

" Persistent undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/tmp/undo/
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

" Note - must be after 'chriskempson/base16-vim' plugin is declared in .vimrc
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  set background=light
  source ~/.vimrc_background
endif

" Must be after sourcing ~/.vimrc_background to override for all colorschemes
highlight ColorColumn ctermbg=gray


"---------------------"
"   Git with Vim      "
"---------------------"
" Force the cursor onto a new line after 80 characters
set textwidth=80

" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Status Line                                     "
"                                                                              "
" From - https://shapeshed.com/vim-statuslines/#what-is-a-statusline-in-vim    "
" From - http://blog.ezyang.com/2010/03/vim-textwidth/                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show status line always
set laststatus=2

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ [fo=%{&fo}]
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Mappings                                           "
"                                                                              "
" From - https://github.com/fatih/vim-go-tutorial/blob/master/vimrc            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","             " Change the mapleader from '\' to ','

" Switch between different windows by their direction
noremap <C-j> <C-w>j    " switching to below window
noremap <C-k> <C-w>k    " switching to above window
noremap <C-l> <C-w>l    " switching to right window
noremap <C-h> <C-w>h    " switching to left window

"-------------------------------------------------
" Tabs
"-------------------------------------------------
" From - https://vim.fandom.com/wiki/Alternative_tab_navigation#Vim_navigation_2
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>

nnoremap H   :tabprev<CR>
nnoremap L   :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>

nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap tx  :tabclose<CR>


" Resize vertical splits
nnoremap <silent> <Leader>0 :exe "vertical resize 100%"<CR>
nnoremap <silent> <Leader>n :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>m :exe "vertical resize -10"<CR>

nnoremap <Leader>w :set list<CR>
nnoremap <Leader>, :source ~/.vimrc<CR>

set pastetoggle=<F2>

" Visual linewise up and down by default (and use gj gk to go quicker)
"noremap <Up> gk
"noremap <Down> gj
"noremap j gj
"noremap k gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - vim-go                                                  "
"                                                                              " " From - https://github.com/fatih/vim-go-tutorial/blob/master/vimrc            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
"let g:go_list_type = "quickfix" j
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1 " Highlight instances of variable under cursor

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>D <Plug>(go-doc)

  " :GoDocBrowser
  autocmd FileType go nmap <Leader>d <Plug>(go-doc-browser)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)

  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - YouCompleteMe & supertab
"                                                                              "
" From -                                                                       " 
"   https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets="<C-l>"

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>', '<C-k>']
"let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']

"let g:SuperTabDefaultCompletionType = '<C-p>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - CtrlP                                                   "
"
" From - https://github.com/ctrlpvim/ctrlp.vim                                 '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use this option to change the mapping to invoke CtrlP in |Normal| mode: >
let g:ctrlp_map = '<c-p>'

" Set the default opening command to use when pressing the above mapping: >
let g:ctrlp_cmd = 'CtrlP'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - NERDCommenter                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-_> :call NERDComment(0,"toggle")<CR>
noremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - NERDTree                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1                         " show hidden files
nnoremap <Leader>f :NERDTreeToggle<Enter>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         GVim Settings                                        "
"                                                                              "
" Note - could also be put in ~/.gvimrc                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  " GUI is running or is about to start.
  set lines=50 columns=150
  winpos 250 70
endif
