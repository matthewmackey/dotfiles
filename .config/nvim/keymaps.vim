"----------------------------------------#
"    Terminal mode                       #
"----------------------------------------#
" Terminal Mode Escape Key - not using <Esc> b/c I need that for Bash's vim-mode
" Exit terminal-mode
" tnoremap <C-?> <C-\><C-n>

" Exit terminal mode then switch tabs
tnoremap <C-PageDown> <C-\><C-n> :tabnext<CR>
tnoremap <C-PageUp>   <C-\><C-n> :tabprevious<CR>

"----------------------------------------#
"    LspSaga                             #
"----------------------------------------#
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
" inoremap <silent> <C-K> <Cmd>Lspsaga signature_help<CR>

" Diagnostics
nnoremap <silent> <C-]> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-[> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>cc :Lspsaga show_cursor_diagnostics<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

"----------------------------------------#
"    NvimTree                            #
"----------------------------------------#
nnoremap <C-\> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeFocus<CR>
nnoremap <leader>ff :NvimTreeFindFile<CR>
nnoremap <leader>ft :NvimTreeFindFileToggle<CR>
nnoremap <leader>fz :NvimTreeResize 40
" nnoremap <leader>fr :NvimTreeRefresh<CR>
" nnoremap <leader>fo :NvimTreeOpen<CR>
" nnoremap <leader>fc :NvimTreeClose<CR>

"----------------------------------------#
"    Telescope                           #
"----------------------------------------#
nnoremap <silent> ,b <cmd>Telescope buffers<CR>
nnoremap <silent> ,c <cmd>Telescope commands<CR>
nnoremap <silent> ,f <cmd>Telescope find_files<CR>
nnoremap <silent> ,g <cmd>Telescope live_grep<CR>
nnoremap <silent> ,h <cmd>Telescope help_tags<CR>

"----------------------------------------#
"    'Test' Plugin                       #
"----------------------------------------#
nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tg :TestVisit<CR>
