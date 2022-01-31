" DISABLE Python2 provider support
let g:loaded_python_provider = 0

" Set python3 exec to be in virtualenv w/ pynvim installed
let g:python3_host_prog = $HOME . '/pythons/default/bin/python3'

" set runtimepath^=~/.config/vim runtimepath+=~/.config/vim/after
" let &packpath = &runtimepath
source ~/.config/vim/vimrc-common.vim

" Persistent undo
set undofile

runtime plug.vim
runtime keymaps.vim

" LOCAL common-Vim overrides
" if filereadable($HOME . '/.config/vim/.vimrc-local')
"   source ~/.config/vim/.vimrc-local
" end
