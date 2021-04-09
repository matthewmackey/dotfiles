""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Plugin - vim-airline                                     "
"             (listed 1st b/c relates to statusline)                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enables use of Powerline fonts
let g:airline_powerline_fonts = 1

" Add buffer, window, and tab #'s to status line
" See: https://github.com/vim-airline/vim-airline/issues/401
let g:airline_section_c =
      \"[%{bufnr('%')}] " .
      \"%<%f%m %#__accent_red#" .
      \"%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#".
      \"(%{tabpagenr()}:%{winnr()}) "

" Use the airline tabline (replacement for buftabline)
" Enables the "arrow" tab line at the top
let g:airline#extensions#tabline#enabled = 1

" When ONLY one tab is open, enable displaying of buffer names on LEFT of tabline
let g:airline#extensions#tabline#show_buffers = 1

" When MORE than one tab open, enable displaying the names of open splits for
" the current tab on RIGHT of tabline
let g:airline#extensions#tabline#show_splits = 1

" Whether to show Tab # and/or # of Splits in tab label (as label prefix)
let g:airline#extensions#tabline#show_tab_nr = 1

" How numbers are displayed in tab mode. >
  "let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
  "let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
  "let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#tab_nr_type = 2

" Allow switching a specific tab by tab #
" Also, when only ONE tab is open, it adds #'s to open buffers (and those
" numbers are a smaller text size for some reason)
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

" Another key mapping for switching through tabs
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - CtrlP                                                   "
"        (https://github.com/ctrlpvim/ctrlp.vim)                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use this option to change the mapping to invoke CtrlP in |Normal| mode: >
let g:ctrlp_map = '<c-p>'

" Set the default opening command to use when pressing the above mapping: >
let g:ctrlp_cmd = 'CtrlP'

" Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs:
let g:ctrlp_show_hidden = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - indentLine                                              "
"        (https://github.com/Yggdroot/indentLine)                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char       = '▏'
let g:indentLine_setConceal = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - NERDTree                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1                         " show hidden files
nnoremap <Leader>f :NERDTreeToggle<Enter>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - undotree                                                "
"      (https://github.com/mbbill/undotree)                                    "
" See : https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 4
let g:undotree_SetFocusWhenToggle       = 1
nnoremap <Leader>u :UndotreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - UltiSnips
" From -                                                                       "
"   https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsListSnippets='<C-l>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - vim-grepper
"      (https://github.com/mhinz/vim-grepper)                                "
" See : https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:grepper = {}
let g:grepper.tools = ["rg"]
runtime autoload/grepper.vim
let g:grepper.jump = 1
nnoremap <Leader>/ :GreperRg<Space>
nnoremap gs :Grepper -cword -noprompt<CR>
xmap gs <Plug>(GrepperOperator)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - vim-auto-save                                           "
"      (https://github.com/907th/vim-auto-save)                                "
" See : https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - vim-go                                                  "
"    (https://github.com/fatih/vim-go-tutorial/blob/master/vimrc)              "
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

