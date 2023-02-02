" TODO: figure out how to keep ALE working w/o the distracting end-of-line
" virtual text messages
"
" Disabling ALE b/c I don't like the end-of-line virtual text
"
" NOTE: vim-go seems to automatically attach its linters to this plugin even
" though I am not defining any Go linters here.  This ends up making the end-of-line
" virtual text messages appear when I'm coding in Go (ie - I'm using vim-go).
"
" You can view ALE's config, which shows all the attached linters, via:
"
"   :ALEInfo
let g:ale_enabled = 0


let g:ale_linters = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'python': ['flake8']
\ }

let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'python': [
    \  'autopep8', 'isort',
    \  'remove_trailing_lines', 'trim_whitespace']
\ }

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warn'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
