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

