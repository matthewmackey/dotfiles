"###################################################################################
 "START From: https://github.com/hamvocke/dotfiles/blob/master/vim/.vimrc
 "With some mmackey edits
"###################################################################################
""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Vundler for plugin management
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
" Custom Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""
"let mapleader=","       " leader is comma

" turn off search highlight with ,-<space>
"nnoremap <leader><space> :nohlsearch<CR>

" Invoke Ctrl-p with c-p
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'


""""""""""""""""""""""""""""""""""""""""""""""""
" General Configuration
""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically update a file if it is changed externally
"set autoread

" Height of the command bar
set cmdheight=2

" NOTE: Use ':noh' or ',h' to turn off search highlighting until next search
set hlsearch	    " highlight search matches

set incsearch	    " search while characters are entered

" search is case-insensitive by default
set ignorecase

" ignore case if search pattern is all lowercase, case-sensitive otherwise
" set smartcase ??

" Show linenumbers
set number

set showcmd	" show last command in the bottom right

set ruler	" always show current position

" Line wrap (number of cols)
set wrap	    " wrap lines only visually
set linebreak	    " wrap only at valid characters
set textwidth=0	    " prevent vim from inserting linebreaks
set wrapmargin=0    "   in newly entered text

" show matching braces
set showmatch

set wildmenu	    " visual autocomplete for command menu


"""""""""""""""""""""""""""""""""""""""""""""""""
" Backups, Swap Files
"""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" UTF-8 encoding and en_US as default encoding/language
set encoding=utf8

" Define standard filetype
set ffs=unix,dos,mac

let base16colorspace=256
colorscheme base16-horizon-dark
set background=dark

set cursorline	" highlight current active line


"""""""""""""""""""""""""""""""""""""""""""""""""
" File Types
"""""""""""""""""""""""""""""""""""""""""""""""""
" recognize .md files as markdown files
"au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" enable spell-checking for markdown files
"autocmd BufRead,BufNewFile *.md setlocal spell


"""""""""""""""""""""""""""""""""""""""""""""""""
" Text and Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""
" Use smart tabs
set smarttab

set expandtab " use spaces, no tabs

" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4

set ai " Auto indent
set si " Smart indent

" modern backspace behavior
set backspace=indent,eol,start

filetype indent on	" enable filetype specific indentation

set nonu

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,nbsp:.


"""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
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
" Ctrl-p
"""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 'ra'


"""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""
" automatically generate HTML files
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]


"""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""
" show hidden files
let NERDTreeShowHidden=1

" open/close NERDTree using Leader-f (,-f)
" <Leader> is \ by default
"nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <C-n> :NERDTreeToggle<Enter>

"""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
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
"------------------------------------------------------------------------------
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
set mouse=a

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
