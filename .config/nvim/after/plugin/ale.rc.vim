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
