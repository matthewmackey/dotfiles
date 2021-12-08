" set runtimepath^=~/.config/vim runtimepath+=~/.config/vim/after
" let &packpath = &runtimepath
source ~/.config/vim/vimrc-common.vim

" DISABLE python provider support until I get my installed Pythons reconfigured
" See: https://neovim.io/doc/user/provider.html#provider-python
if has('nvim')
  let g:loaded_python_provider = 0
  let g:loaded_python3_provider = 0
endif

" Terminal Mode - Escape Key
" Not using <Esc> b/c I need that for Bash's vim-mode
tnoremap <C-Space>    <C-\><C-n>

" Exit terminal mode then switch tabs
tnoremap <C-PageDown> <C-\><C-n> :tabnext<CR>
tnoremap <C-PageUp>   <C-\><C-n> :tabprevious<CR>

" Persistent undo
set undofile

runtime plug.vim
