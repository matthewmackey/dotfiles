""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - vim-go                                                  "
"    (https://github.com/fatih/vim-go-tutorial/blob/master/vimrc)              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'

let g:go_autodetect_gopath = 1
"let g:go_list_type = "quickfix" j
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1 " Highlight instances of variable under cursor

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" TODO: figure out a good way to do single-key :cnext/:cprev - I currently have
" them mapped to a leader mapping in the general keymap file.
"
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>cc
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <leader>cc :cclose<CR>

" TODO: figure out a way to map these elsewhere b/c I currently use Vim's `1<C-g>` keymapping
"
" Open :GoDeclsDir with ctrl-g
" nmap <C-g> :GoDeclsDir<cr>
" imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  "
  " TODO: figure out why this is not getting triggered when file is opened from
  " command-line but only it `:e` is run or if it is opened from nvim-tree
  "
  " (first three lines are debug statements)
  " autocmd BufWinEnter *.go echomsg "BufWinEnter - " . strftime("%c")
  " autocmd BufNewFile *.go echomsg "BufNewFile - " . strftime("%c")
  " autocmd BufRead *.go echomsg "BufRead - " . strftime("%c")
  " autocmd FileType go echomsg "FileType go - " . strftime("%c")
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  "
  " NEED the nnoremap here b/c otherwise whenever this keymapping was entered,
  " all that would happen is that `<SNR>135_build_go_files()` would get printed
  " ad the top of the file it was called from
  "
  " TODO: figure out where the potential conflicting keymapping is to prevent recursion (??)
  autocmd FileType go nnoremap <leader>b :call <SID>build_go_files()<CR>

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoDocBrowser
  autocmd FileType go nmap <Leader>d <Plug>(go-doc-browser)

  " :GoDoc
  autocmd FileType go nmap <Leader>D <Plug>(go-doc)

  " NOT DOING b/c we use `let g:go_auto_type_info = 1`
  " " :GoInfo
  " autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoSameIdsToggle
  autocmd FileType go nnoremap <Leader>i :GoSameIdsToggle<CR>

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>ml <Plug>(go-metalinter)

  " :GoDecls
  autocmd FileType go nmap <leader>ll <Plug>(go-decls)

  " :GoDeclsDir
  autocmd FileType go nmap <leader>ld <Plug>(go-decls-dir)

  " :GoRun
  autocmd FileType go nmap <leader>r <Plug>(go-run)

  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  "
  " :GoTest
  autocmd FileType go nmap <leader>t <Plug>(go-test)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang GoAlternate call go#alternate#Switch(<bang>0, 'edit')

  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang GoAlternateSplit call go#alternate#Switch(<bang>0, 'split')

  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  autocmd Filetype go command! -bang GoAlternateTab call go#alternate#Switch(<bang>0, 'tabe')

  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang GoAlternateVsplit call go#alternate#Switch(<bang>0, 'vsplit')

  autocmd FileType go nnoremap <Leader>al :GoAlternate<CR>
  autocmd FileType go nnoremap <Leader>as :GoAlternateSplit<CR>
  autocmd FileType go nnoremap <Leader>at :GoAlternateTab<CR>
  autocmd FileType go nnoremap <Leader>av :GoAlternateVsplit<CR>

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

