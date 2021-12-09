if !exists('g:loaded_lspsaga')
  finish
endif

lua <<EOF
local saga = require('lspsaga')

saga.init_lsp_saga {
  border_style = "round",
}
EOF

nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

" inoremap <silent> <C-K> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>

" Diagnostics
nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-K> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>cc :Lspsaga show_cursor_diagnostics<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

" vim: ft=lua :
