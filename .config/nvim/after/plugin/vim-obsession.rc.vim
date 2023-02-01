" See: https://dockyard.com/blog/2019/06/25/simple-vim-session-management-part-2
let g:session_dir = '~/.local/share/nvim/sessions'

" Save/Load sessions
"
" 5x <BS> to delete `*.vim` from the command-window so you can do tab-completion of filenames
exec 'nnoremap <Leader>ss :Obsession ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Pause session
nnoremap <Leader>sp :Obsession<CR>
