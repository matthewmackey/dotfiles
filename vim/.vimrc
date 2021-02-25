"##################################################################################
 "START From: https://github.com/hamvocke/dotfiles/blob/master/vim/.vimrc
 "With some mmackey edits
"###################################################################################
""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vundler For Plugin Management:
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERD tree - tree explorer
Plugin 'scrooloose/nerdtree'

" Base16 colorschemes
Plugin 'chriskempson/base16-vim'

" Ctrl-p
"Plugin 'kien/ctrlp.vim'

" Elixir syntax highlighting
"Plugin 'elixir-lang/vim-elixir'

" Vimwiki
"Plugin 'vimwiki/vimwiki'


" NERD Commenter
" https://github.com/preservim/nerdcommenter
Plugin 'preservim/nerdcommenter'

" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Keybindings:
"""""""""""""""""""""""""""""""""""""""""""""""""
"let mapleader=","       " leader is comma

" turn off search highlight with ,-<space>
"nnoremap <leader><space> :nohlsearch<CR>

" Invoke Ctrl-p with c-p
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'


""""""""""""""""""""""""""""""""""""""""""""""""
" General Configuration:
""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically update a file if it is changed externally
"set autoread

" Height of the command bar
set cmdheight=1

" NOTE: Use ':noh' or ',h' to turn off search highlighting until next search
set hlsearch	    " highlight search matches

set incsearch	    " search while characters are entered

" search is case-sensitive by default
set ignorecase

" ignore case if search pattern is all lowercase, case-sensitive otherwise
" NOTE: requires 'set ignorecase' also to work
set smartcase

" Show linenumbers
set number

" show last command in the bottom right
set showcmd

" always show current position
set ruler

" show matching braces
set showmatch

" visual autocomplete for command menu
set wildmenu


"""""""""""""""""""""""""""""""""""""""""""""""""
" Backups And Swap Files:
"""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""
" Colors And Fonts:
"""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" UTF-8 encoding and en_US as default encoding/language
set encoding=utf8

" Define standard filetype
set ffs=unix,dos,mac

let base16colorspace=256
colorscheme base16-horizon-dark
set background=light

"set cursorline	" highlight current active line


"""""""""""""""""""""""""""""""""""""""""""""""""
" File Types:
"""""""""""""""""""""""""""""""""""""""""""""""""
" recognize .md files as markdown files
"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" enable spell-checking for markdown files
"autocmd BufRead,BufNewFile *.md setlocal spell


"""""""""""""""""""""""""""""""""""""""""""""""""
" Text And Indentation:
"""""""""""""""""""""""""""""""""""""""""""""""""
" Use smart tabs
set smarttab

set expandtab " use spaces, no tabs

" 1 tab == 4 spaces
set shiftwidth=2
set softtabstop=2

set ai " Auto indent
set si " Smart indent

" modern backspace behavior
set backspace=indent,eol,start

filetype indent on	" enable filetype specific indentation

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:.


"""""""""""""""""""""""""""""""""""""""""""""""""
" Movement:
"""""""""""""""""""""""""""""""""""""""""""""""""
" move vertically by visual line (don't skip wrapped lines) 
"nnoremap j gj
"nnoremap k gk

" From: https://github.com/preservim/nerdtree/wiki/F.A.Q.
" Switch between different windows by their direction
no <C-j> <C-w>j    " switching to below window 
no <C-k> <C-w>k    " switching to above window
no <C-l> <C-w>l    " switching to right window 
no <C-h> <C-w>h    " switching to left window

"""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl P:
"""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 'ra'


"""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki:
"""""""""""""""""""""""""""""""""""""""""""""""""
" automatically generate HTML files
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]


"""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree:
"""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files
let NERDTreeShowHidden=1

" open/close NERDTree using Leader-f (,-f)
" <Leader> is \ by default
"nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <C-n> :NERDTreeToggle<Enter>


"""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter:
"""""""""""""""""""""""""""""""""""""""""""""""""
" Bug: https://stackoverflow.com/questions/9051837/how-to-map-c-to-toggle-comments-in-vim
inoremap <C-_> :call NERDComment(0,"toggle")<CR>
noremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

"###################################################################################
" END From: (github.com/hamvocke/dotfiles)
"###################################################################################


"###################################################################################
" START: mmackey
"###################################################################################
"-----------------------------------------------------------------------------------
" Base16 shell creates Vim colorscheme file at ~/.vimrc_background
" From: https://github.com/chriskempson/base16-shell
"
" This must be placed after 'chriskempson/base16-vim' plugin is declared in .vimrc
"-----------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" ColorColumn: must be after soucing ~/.vimrc_background so it can override
" the color for all colorschemes
highlight ColorColumn ctermbg=red


"------------------------------------------------------------------------------
" From: https://csswizardry.com/2017/03/configuring-git-and-vim/
" Plus: mmackey edits
"------------------------------------------------------------------------------
" wrap lines only visually
"set wrap

" wrap only at valid characters
"set linebreak

" in newly entered text
"set wrapmargin=0

" Force the cursor onto a new line after 80 characters
set textwidth=80

" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51


"-----------------------------------------------------
" From: http://stackoverflow.com/questions/7652820/how-to-disable-the-auto-comment-in-shell-script-vi-editing
"-----------------------------------------------------
" Needed to stop vim from automatically commenting out any text I paste to a file
" Search for highlighted text
" from an external source (that starts with a #...not sure if only in this case??)
set paste


"-----------------------------------------------------
" From: https://www.cs.swarthmore.edu/help/vim/etc.html
"-----------------------------------------------------
" Allow mouse to move cursor
"set mouse=a
set mouse-=a


""-----------------------------------------------------
"" From: https://github.com/derekwyatt/vim-config/blob/master/vimrc
""-----------------------------------------------------
"" change the mapleader from \ to ,
"let mapleader=","
"
"" Turn off that stupid highlight search
"nmap <silent> ,n :nohls<CR>
"
"" Quickly edit/reload the vimrc file
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"" this next one turns of highlighting for some reason when re-loading .vimrc ??
"nmap <silent> <leader>sv :so $MYVIMRC<CR>
"

""-----------------------------------------------------
"" From: http://vim.wikia.com/wiki/Search_for_visually_selected_text
""-----------------------------------------------------
"" Search for highlighted text
"vnorem // y/<c-r>"<cr>


""-----------------------------------------------------
"" From: https://blog.pentesterlab.com/keeping-notes-during-a-pentest-security-assessment-code-review-7e6db8091a66
""-----------------------------------------------------
set foldmethod=marker
set foldmarker={{,}}


"-----------------------------------------------------------------------------
" LEADER:
"-----------------------------------------------------------------------------
" Change the mapleader from \ to ,
let mapleader=","


"-----------------------------------------------------------------------------
" SPLITTING:
"-----------------------------------------------------------------------------
set splitright

nnoremap <silent> <Leader>0 :exe "vertical resize 100%"<CR>
nnoremap <silent> <Leader>n :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>m :exe "vertical resize -10"<CR>


"----------------------------------------------------------------------------
" STATUS Line:
"
" FROM: https://shapeshed.com/vim-statuslines/#what-is-a-statusline-in-vim
" AND: http://blog.ezyang.com/2010/03/vim-textwidth/
"----------------------------------------------------------------------------
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


"----------------------------------------------------------------------------
" Trailing Whitespace:
"
" FROM: https://vim.fandom.com/wiki/Highlight_unwanted_spaces
"----------------------------------------------------------------------------
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()


"----------------------------------------------------------------------------
" GVim Settings:
"
" NOTE: could also be put in ~/.gvimrc
"----------------------------------------------------------------------------
if has("gui_running")
  " GUI is running or is about to start.
   set lines=50 columns=150
   winpos 250 70
endif

