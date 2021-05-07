"-----------------------------------------
" Key Mappings
"-----------------------------------------
" Change the mapleader from '\' to ','
let mapleader=","

" Terminal Mode - Escape Key
if has('nvim')
  tnoremap <C-Space> <C-\><C-n>
endif

nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>ps :PlugStatus<CR>

" Remap `:help` in command-mode to `:tab help`
" See: https://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit/7515418#7515418
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

nnoremap <Leader>l :set list!<CR>
nnoremap <Leader>, :source ~/.vimrc<CR>
nnoremap <Leader>p :set invpaste<CR>

" Switch between different windows by their direction
noremap <C-j> <C-w>j    " switching to below window
noremap <C-k> <C-w>k    " switching to above window
noremap <C-l> <C-w>l    " switching to right window
noremap <C-h> <C-w>h    " switching to left window

" Maximize window all directions
noremap <silent> <Leader>z :resize 99999<CR>:vertical resize 99999<CR>

noremap <silent> <Leader>ww :vertical resize 99999<CR> " Maximize window horizontally ("my horizontal")
noremap <silent> <Leader>wv <C-w>_                     " Maximize window vertically ("my vertical")
noremap          <Leader>= <C-w>=                      " Make windows all equal size

nnoremap <silent> <Leader>n :exe "vertical resize +10"<CR>
nnoremap <silent> <Leader>m :exe "vertical resize -10"<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Change working directory of window to be the directory of current file anytime
" we change windows (ie - each window has a workdir of where its file resides)
"
" 'When a |:lcd| command has been used for a window, the specified directory
" becomes the current directory for that window.  Windows where the |:lcd|
" command has not been used stick to the global or tab-local current directory.'
autocmd BufEnter * silent! lcd %:p:h

"-------------------------------------------------
" Tabs
"-------------------------------------------------
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

" Couldn't get <C-PageUp/Down> to work even after I disabled those keybindings
" in my terminal settings "Edit -> Preferences -> Shortcuts'
" See here for some info:
"   https://stackoverflow.com/questions/1814373/why-do-c-pageup-and-c-pagedown-not-work-in-vim
nnoremap <C-PageUp>   :tabprev<CR>
nnoremap <C-PageDown> :tabnext<CR>

" Go to prev tab page; wraps around from 1st to last
" (can't use HJKL alone because I need those standard Vim bindings))
nnoremap <Leader>H   :tabprev<CR>
nnoremap <Leader>tj  :tabprev<CR>
nnoremap <Leader>P   :tabprev<CR>

" Go to next tab page; wraps around from last to 1st
nnoremap <Leader>L   :tabnext<CR>
nnoremap <Leader>tk  :tabnext<CR>
nnoremap <Leader>N   :tabprev<CR>

" Go to 1st tab
nnoremap <Leader>th  :tabfirst<CR>

" Go to last tab
nnoremap <Leader>tl  :tablast<CR>

"-----------------------------
" Completion mappings
" See: https://github.com/bluz71/dotfiles/blob/master/vim/custom/mappings.vim#L220
"-----------------------------
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

