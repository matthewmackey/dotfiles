""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Functions: Custom MM                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----------------------------------------------------------
" Functions to show syntax group(s) for char under cursor
"----------------------------------------------------------
" See: https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

function! MmSynUnderCursor()
  echo "SynGroup:\n"
  call SynGroup()
  echo "\nSynStack:\n"
  call SynStack()
endfunction

map <Leader>s :call MmSynUnderCursor()<CR>

"-------------------------------------------------------
" Functions to select from a set of vim-airline themes
"-------------------------------------------------------
" See theme screenshots here:
"   https://github.com/vim-airline/vim-airline/wiki/Screenshots

"--------------------------
" DEFAULT Airline Theme
"--------------------------
let g:airline_theme = 'papercolor'

let g:mm_airline_themes = ['dark', 'light', 'murmur', 'papercolor', 'solarized']
let g:mm_airline_themes_current_index = 0

function ListMmAirlineThemes()
  echo 'Available "mm" themes: '
  let l:i = 0
  for l:theme in g:mm_airline_themes
   echo l:i . ': ' . g:mm_airline_themes[l:i]
   let l:i += 1
  endfor
endfunction

function SelectMmAirlineTheme(airline_theme_index)
  let l:curr_theme = g:mm_airline_themes[g:mm_airline_themes_current_index]

  "echo 'index provided: [' a:airline_theme_index . ']'
  let l:len_airline_themes = len(g:mm_airline_themes)
  if a:airline_theme_index >= l:len_airline_themes
    echo 'Invalid index provided: [' a:airline_theme_index . ']'
    echo "\n"
    :call ListMmAirlineThemes()
    return 1
  endif

  let next_theme = g:mm_airline_themes[a:airline_theme_index]

  execute  'AirlineTheme ' . l:next_theme
  echo 'Changed theme from [' . l:curr_theme . '] -> [' . l:next_theme . ']'
endfunction

function NextMmAirlineTheme(...)
  if a:0 > 0
    let l:theme_index_increment = a:1
  else
    let l:theme_index_increment = 1
  endif
  "echo 'increment -> ' . l:theme_index_increment
  "echo 'len(airline_themes) -> [' .  len(g:mm_airline_themes) . ']'
  "echo 'curr_index -> [' . g:mm_airline_themes_current_index . ']'
  "echo 'curr_index + 1 -> [' . (g:mm_airline_themes_current_index + 1) . ']'
  "echo '((curr_index + 1) % length) -> [' . ( ((g:mm_airline_themes_current_index + 1) % len(g:mm_airline_themes)) ) . ']'

  let l:next_theme_index = ((g:mm_airline_themes_current_index + l:theme_index_increment) % len(g:mm_airline_themes))
  if l:next_theme_index == -1
      let l:next_theme_index = 0
      "echo 'next_theme_index was -1; setting index to 0'
  endif
  "echo 'next_theme_index -> [' . l:next_theme_index . ']'

  let l:curr_theme = g:mm_airline_themes[g:mm_airline_themes_current_index]
  "echo 'curr_theme -> [' . l:curr_theme . ']'

  let g:mm_airline_themes_current_index = l:next_theme_index
  "echo 'next_curr_index -> [' . g:mm_airline_themes_current_index . ']'

  let next_theme = g:mm_airline_themes[g:mm_airline_themes_current_index]
  "echo 'next_theme -> [' . l:next_theme . ']'
  execute  'AirlineTheme ' . l:next_theme
  echo 'Changed theme from [' . l:curr_theme . '] -> [' . l:next_theme . ']'
endfunction

function PrevMmAirlineTheme()
  :call NextMmAirlineTheme(-1)
endfunction

" It is recommended to use a 'command' instead of 'input()'
" See :
"  - https://vi.stackexchange.com/questions/20760/how-to-add-a-count-to-a-binding
"  - https://vi.stackexchange.com/questions/4753/is-it-possible-to-create-mappings-with-parameters
command! -nargs=1 SelectMmAirlineTheme :call SelectMmAirlineTheme(<q-args>)
nnoremap <Leader>hs :<C-u>call SelectMmAirlineTheme(v:count)<CR>

nnoremap <Leader>hl :call ListMmAirlineThemes()<CR>
nnoremap <Leader>hn :call NextMmAirlineTheme()<CR>
nnoremap <Leader>hp :call PrevMmAirlineTheme()<CR>

