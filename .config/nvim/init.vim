" DISABLE Python2 provider support
let g:loaded_python_provider = 0

" Set python3 exec to be in virtualenv w/ pynvim installed
let g:python3_host_prog = $HOME . '/pythons/default/bin/python3'

" set runtimepath^=~/.config/vim runtimepath+=~/.config/vim/after
" let &packpath = &runtimepath
source ~/.config/vim/vimrc-common.vim

" Terminal Mode - Escape Key
" Not using <Esc> b/c I need that for Bash's vim-mode
tnoremap <C-Space>    <C-\><C-n>

" Exit terminal mode then switch tabs
tnoremap <C-PageDown> <C-\><C-n> :tabnext<CR>
tnoremap <C-PageUp>   <C-\><C-n> :tabprevious<CR>

" Persistent undo
set undofile

runtime plug.vim
