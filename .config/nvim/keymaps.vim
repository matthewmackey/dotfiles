" --------------------------------------------------------------------------------------------------------------
" ALLOWED Keymappings:
"
"   https://stackoverflow.com/questions/8033779/is-there-a-way-to-map-ctrl-period-and-ctrl-comma-in-vim
"
" --------------------------------------------------------------------------------------------------------------

"----------------------------------------#
"    ALE                                 #
"----------------------------------------#
nnoremap ,lf <Cmd>ALEFix<CR>


"----------------------------------------#
"    LspSaga                             #
"----------------------------------------#
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
" inoremap <silent> <C-K> <Cmd>Lspsaga signature_help<CR>

" Diagnostics
nnoremap <C-n> :Lspsaga diagnostic_jump_next<CR>
nnoremap <C-p> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <leader>cc :Lspsaga show_cursor_diagnostics<CR>
nnoremap <leader>cl :Lspsaga show_line_diagnostics<CR>


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
"    NvimTreesitter                      #
"----------------------------------------#
nnoremap ,lt <cmd>TSBufToggle highlight<CR>


"----------------------------------------#
"    Terminal mode                       #
"----------------------------------------#
" Terminal Mode Escape Key - not using <Esc> b/c I need that for Bash's vim-mode
" Exit terminal-mode
tnoremap <C-BS> <C-\><C-n>

" Exit terminal mode then switch tabs
tnoremap <C-PageDown> <C-\><C-n> :tabnext<CR>
tnoremap <C-PageUp>   <C-\><C-n> :tabprevious<CR>

" Create abbreviations for various `:terminal` commands in command-mode
"  - SEE: https://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit/7515418#7515418
cnoreabbrev <expr> term getcmdtype() == ":" && getcmdline() == 'term' ? 'tabnew \| term' : 'term'
cnoreabbrev <expr> terminal getcmdtype() == ":" && getcmdline() == 'terminal' ? 'tabnew \| terminal' : 'terminal'
cnoreabbrev <expr> vterm getcmdtype() == ":" && getcmdline() == 'vterm' ? 'vnew \| term' : 'vterm'
cnoreabbrev <expr> hterm getcmdtype() == ":" && getcmdline() == 'hterm' ? 'new \| term' : 'hterm'

"----------------------------------------#
"    'Test' Plugin                       #
"----------------------------------------#
" Don't want to override :tabnew keybinding for now
" nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tg :TestVisit<CR>


"----------------------------------------#
"    UndoTree                            #
"----------------------------------------#
nnoremap <leader>5 :UndotreeToggle<cr>


"----------------------------------------#
"    Telescope {{{                       #
"----------------------------------------#
" nnoremap <silent> ,b <cmd>Telescope buffers<CR>
" nnoremap <silent> ,c <cmd>Telescope commands<CR>
" nnoremap <silent> ,f <cmd>Telescope find_files<CR>
" nnoremap <silent> ,g <cmd>Telescope live_grep<CR>
" nnoremap <silent> ,h <cmd>Telescope help_tags<CR>

" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"-----------------------------------------------"
" Standard
"-----------------------------------------------"
" builtin.builtin
nnoremap <leader>tb <cmd>lua require('telescope.builtin').builtin()<cr>

" fzf_writer.files - more async version find_files()
nnoremap <leader>f <cmd>lua require('telescope').extensions.fzf_writer.files()<cr>

" builtin.find_files - Lists files in your current working directory, respects .gitignore
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>

" builtin.file_browser - ists files and folders in your current working directory, open files, navigate your filesystem, and create new files and folders
nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser()<cr>

" builtin.git_files - Fuzzy search through the output of git ls-files command, respects .gitignore, optionally ignores untracked files
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>

" builtin.grep_string - Searches for the string under your cursor in your current working directory
nnoremap <leader>gs <cmd>lua require('telescope.builtin').grep_string()<cr>

" builtin.live_grep - Search for a string in your current working directory and get results live as you type (respecting .gitignore)
nnoremap <leader>lg <cmd>lua require('telescope.builtin').live_grep()<cr>

" fzf_writer.grep - more async version of live_grep()
nnoremap <leader>gp lua require('telescope').extensions.fzf_writer.grep()<cr>

" fzf_writer.staged_grep - more async version w/ enhancements of live_grep()
nnoremap <leader>sg <cmd>lua require('telescope').extensions.fzf_writer.staged_grep()

"-----------------------------------------------"
" Git
"-----------------------------------------------"
" builtin.git_commits - Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>

" builtin.git_bcommits - Lists buffer's git commits with diff preview and checks them out on <cr>
nnoremap <leader>gbc <cmd>lua require('telescope.builtin').git_bcommits()<cr>

" builtin.git_branches - Lists all branches with log preview, checkout action <cr>, track action <C-t> and rebase action<C-r>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>

" builtin.git_status - Lists current changes per file with diff preview and add action. (Multi-selection still WIP)
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>

" builtin.git_stash - Lists stash items in current repository with ability to apply them on <cr>
nnoremap <leader>gsh <cmd>lua require('telescope.builtin').git_stash()<cr>

"-----------------------------------------------"
" Treesitter
"-----------------------------------------------"
" builtin.treesitter - Lists Function names, variables, from Treesitter!one
nnoremap <leader>tre <cmd>lua require('telescope.builtin').treesitter()<cr>

"-----------------------------------------------"
" Vim objects
"-----------------------------------------------"
" builtin.buffers - Lists open buffers in current neovim instance
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>

" builtin.oldfiles - Lists previously open files
" nnoremap <leader> <cmd>lua require('telescope.builtin').oldfiles()<cr>

" builtin.commands - Lists available plugin/user commands and runs them on <cr>
nnoremap <leader>c <cmd>lua require('telescope.builtin').commands()<cr>

" builtin.tags - Lists tags in current directory with tag location file preview (users are required to run ctags -R to generate tags or update when introducing new changes)
nnoremap <leader>ta <cmd>lua require('telescope.builtin').tags()<cr>

" builtin.command_history - Lists commands that were executed recently, and reruns them on <cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').command_history()<cr>

" builtin.search_history - Lists searches that were executed recently, and reruns them on <cr>
nnoremap <leader>sh <cmd>lua require('telescope.builtin').search_history()<cr>

" builtin.help_tags - Lists available help tags and opens a new window with the relevant help info on <cr>
nnoremap <leader>th <cmd>lua require('telescope.builtin').help_tags()<cr>

" builtin.man_pages - Lists manpage entries, opens them in a help window on <cr>
nnoremap <leader>mn <cmd>lua require('telescope.builtin').man_pages()<cr>

" builtin.marks - Lists vim marks and their value
nnoremap <leader>mk <cmd>lua require('telescope.builtin').marks()<cr>

" builtin.colorscheme - Lists available colorschemes and applies them on <cr>
nnoremap <leader>cs <cmd>lua require('telescope.builtin').colorscheme()<cr>

" builtin.quickfix - Lists items in the quickfix list
nnoremap <leader>qf <cmd>lua require('telescope.builtin').quickfix()<cr>

" builtin.loclist - Lists items from the current window's location list
nnoremap <leader>ll <cmd>lua require('telescope.builtin').loclist()<cr>

" builtin.jumplist - Lists Jump List entries
nnoremap <leader>jl <cmd>lua require('telescope.builtin').jumplist()<cr>

" builtin.vim_options - Lists vim options, allows you to edit the current value on <cr>
" nnoremap <leader> <cmd>lua require('telescope.builtin').vim_options()<cr>

" builtin.registers - Lists vim registers, pastes the contents of the register on <cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').registers()<cr>

" builtin.autocommands - Lists vim autocommands and goes to their declaration on <cr>
nnoremap <leader>au <cmd>lua require('telescope.builtin').autocommands()<cr>

" builtin.spell_suggest - Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>
" nnoremap <leader> <cmd>lua require('telescope.builtin').spell_suggest()<cr>

" builtin.keymaps - Lists normal mode keymappings
nnoremap <leader>km <cmd>lua require('telescope.builtin').keymaps()<cr>

" " builtin.filetypes - Lists all available filetypes
" nnoremap <leader> <cmd>lua require('telescope.builtin').filetypes()<cr>

" " builtin.highlights - Lists all available highlights
" nnoremap <leader> <cmd>lua require('telescope.builtin').highlights()<cr>

" " builtin.current_buffer_fuzzy_find - Live fuzzy search inside of the currently open buffer
" nnoremap <leader> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

" " builtin.current_buffer_tags - Lists all of the tags for the currently open buffer, with a preview
" nnoremap <leader> <cmd>lua require('telescope.builtin').current_buffer_tags()<cr>

" " builtin.resume - Lists the results incl. multi-selections of the previous picker
" nnoremap <leader> <cmd>lua require('telescope.builtin').resume()<cr>

" " builtin.pickers - Lists the previous pickers incl. multi-selections (see :h telescope.defaults.cache_picker)
nnoremap <leader> <cmd>lua require('telescope.builtin').pickers()<cr>

"-----------------------------------------------"
" LSP objects
"-----------------------------------------------"
" builtin.lsp_references - Lists LSP references for word under the cursor
nnoremap <leader>lr <cmd>lua require('telescope.builtin').lsp_references()<cr>

" builtin.lsp_document_symbols - Lists LSP document symbols in the current buffer
nnoremap <leader>lds <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>

" builtin.lsp_workspace_symbols - Lists LSP document symbols in the current workspace
nnoremap <leader>lws <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>

" builtin.lsp_dynamic_workspace_symbols - Lists LSP for all workspace symbols
nnoremap <leader>ldws <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>

" builtin.lsp_code_actions - Lists any LSP actions for the word under the cursor, that can be triggered with <cr>
nnoremap <leader>lca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>

" builtin.lsp_range_code_actions - Lists any LSP actions for a given range, that can be triggered with <cr>
" nnoremap <leader> <cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>

" builtin.diagnostics - Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
nnoremap <leader>d <cmd>lua require('telescope.builtin').diagnostics()<cr>

" builtin.lsp_implementations - Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
nnoremap <leader>li <cmd>lua require('telescope.builtin').lsp_implementations()<cr>

" builtin.lsp_definitions - Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
nnoremap <leader>ld <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

" builtin.lsp_type_definitions - Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope
nnoremap <leader>ltd <cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>

" }}} Telescope
