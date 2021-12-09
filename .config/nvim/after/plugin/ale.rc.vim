let g:ale_linters = {
  \ 'python': 'all'
\ }

let g:ale_fixers = {
  \ 'python': [
    \  'autopep8', 'isort',
    \  'remove_trailing_lines', 'trim_whitespace']
\ }

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warn'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
