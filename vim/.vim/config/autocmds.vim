"-------------------------------------------------------------------------------
" See :
"  https://github.com/bluz71/dotfiles/blob/master/vim/custom/autocmds.vim
"-------------------------------------------------------------------------------

augroup MmCustomEvents
  " Note, 'autocmd!' is used to clear out any existing definitions in this
  " auto-group. This prevents duplicate entries upon a live ~/vimrc reload
  autocmd!

  " Close Vim if NERDTree is only window still open
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup END

