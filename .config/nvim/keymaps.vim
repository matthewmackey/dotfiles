" --------------------------------------------------------------------------------------------------------------
" ALLOWED Keymappings:
"
"   https://stackoverflow.com/questions/8033779/is-there-a-way-to-map-ctrl-period-and-ctrl-comma-in-vim
"
" --------------------------------------------------------------------------------------------------------------

"----------------------------------------#
"    GENERAL {{{                         #
"----------------------------------------#
" map <leader>cn :cnext<CR>
" map <leader>cp :cprevious<CR>

" }}} GENERAL


"----------------------------------------#
"    ALE {{{                             #
"----------------------------------------#
nnoremap ,lf <Cmd>ALEFix<CR>
" }}} ALE


"----------------------------------------#
"    LspSaga {{{                         #
"----------------------------------------#
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
" inoremap <silent> <C-K> <Cmd>Lspsaga signature_help<CR>

" Diagnostics
nnoremap <C-n> :Lspsaga diagnostic_jump_next<CR>
nnoremap <C-p> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <leader>cc :Lspsaga show_cursor_diagnostics<CR>
nnoremap <leader>cl :Lspsaga show_line_diagnostics<CR>
" }}} LspSaga


"----------------------------------------#
"    NvimTree {{{                        #
"----------------------------------------#
nnoremap <C-\> :NvimTreeToggle<CR>
nnoremap <leader>fr :NvimTreeFocus<CR>
nnoremap <leader>ff :NvimTreeFindFile<CR>
nnoremap <leader>ft :NvimTreeFindFileToggle<CR>
nnoremap <leader>fz :NvimTreeResize 40
" nnoremap <leader>fr :NvimTreeRefresh<CR>
" nnoremap <leader>fo :NvimTreeOpen<CR>
" nnoremap <leader>fc :NvimTreeClose<CR>

" }}} NvimTree


"----------------------------------------#
"    NvimTreesitter {{{                  #
"----------------------------------------#
nnoremap ,lt <cmd>TSBufToggle highlight<CR>
" }}} NvimTreesitter


"----------------------------------------#
"    Terminal mode {{{                   #
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
" }}} Terminal mode


"----------------------------------------#
"    'Test' Plugin {{{                   #
"----------------------------------------#
" Don't want to override :tabnew keybinding for now
" nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tg :TestVisit<CR>

" }}} 'Test' Plugin


"-----------------------------------------------"
" Telescope - Special {{{
"-----------------------------------------------"
" builtin.pickers - Lists the previous pickers incl. multi-selections (see :h telescope.defaults.cache_picker)
"
" TODO: figure out another keybinding for this; when it is just `,` it
" will run this command for any `,*`; disabling this for now
nnoremap ,p <cmd>lua require('telescope.builtin').pickers()<cr>

" builtin.resume - Lists the results incl. multi-selections of the previous picker
nnoremap ,re <cmd>lua require('telescope.builtin').resume()<cr>

" }}} Telescope - Special


"-----------------------------------------------"
" Telescope - Standard {{{
"-----------------------------------------------"
" builtin.builtin
nnoremap ,b <cmd>lua require('telescope.builtin').builtin()<cr>

" builtin.diagnostics - Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
nnoremap ,d <cmd>lua require('telescope.builtin').diagnostics()<cr>

" builtin.find_files - Lists files in your current working directory, respects .gitignore
nnoremap ,ff <cmd>lua require('telescope.builtin').find_files()<cr>

" builtin.file_browser - Lists files and folders in your current working directory, open files, navigate your filesystem, and create new files and folders
nnoremap ,fb <cmd>lua require('telescope.builtin').file_browser()<cr>

" builtin.grep_string - Searches for the string under your cursor in your current working directory
nnoremap ,gs <cmd>lua require('telescope.builtin').grep_string()<cr>

" builtin.live_grep - Search for a string in your current working directory and get results live as you type (respecting .gitignore)
nnoremap ,lg <cmd>lua require('telescope.builtin').live_grep()<cr>

" fzf_writer.files - more async version find_files()
nnoremap ,fzf <cmd>lua require('telescope').extensions.fzf_writer.files()<cr>

" fzf_writer.grep - more async version of live_grep()
nnoremap ,fzg <cmd>lua require('telescope').extensions.fzf_writer.grep()<cr>

" fzf_writer.staged_grep - more async version w/ enhancements of live_grep()
nnoremap ,fzs <cmd>lua require('telescope').extensions.fzf_writer.staged_grep()

" }}} Telescope - Standard


"-----------------------------------------------"
" Telescope - Git {{{
"-----------------------------------------------"
" builtin.git_commits - Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
nnoremap ,gco <cmd>lua require('telescope.builtin').git_commits()<cr>

" builtin.git_bcommits - Lists buffer's git commits with diff preview and checks them out on <cr>
nnoremap ,gcb <cmd>lua require('telescope.builtin').git_bcommits()<cr>

" builtin.git_branches - Lists all branches with log preview, checkout action <cr>, track action <C-t> and rebase action<C-r>
nnoremap ,gb <cmd>lua require('telescope.builtin').git_branches()<cr>

" builtin.git_files - Fuzzy search through the output of git ls-files command, respects .gitignore, optionally ignores untracked files
nnoremap ,gf <cmd>lua require('telescope.builtin').git_files()<cr>

" builtin.git_status - Lists current changes per file with diff preview and add action. (Multi-selection still WIP)
nnoremap ,gst <cmd>lua require('telescope.builtin').git_status()<cr>

" builtin.git_stash - Lists stash items in current repository with ability to apply them on <cr>
nnoremap ,gsh <cmd>lua require('telescope.builtin').git_stash()<cr>

" }}} Telescope - Git


"-----------------------------------------------"
" Telescope - LSP objects {{{
"-----------------------------------------------"
" builtin.lsp_definitions - Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
nnoremap ,ld <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

" builtin.lsp_document_symbols - Lists LSP document symbols in the current buffer
nnoremap ,lds <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>

" builtin.lsp_dynamic_workspace_symbols - Lists LSP for all workspace symbols
nnoremap ,ldw <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>

" builtin.lsp_code_actions - Lists any LSP actions for the word under the cursor, that can be triggered with <cr>
nnoremap ,lca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>

" builtin.lsp_range_code_actions - Lists any LSP actions for a given range, that can be triggered with <cr>
nnoremap ,lcr <cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>

" builtin.lsp_implementations - Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
nnoremap ,li <cmd>lua require('telescope.builtin').lsp_implementations()<cr>

" builtin.lsp_references - Lists LSP references for word under the cursor
nnoremap ,lr <cmd>lua require('telescope.builtin').lsp_references()<cr>

" builtin.lsp_type_definitions - Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope
nnoremap ,ltd <cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>

" builtin.lsp_workspace_symbols - Lists LSP document symbols in the current workspace
nnoremap ,lw <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>

" }}} Telescope - LSP objects


"-----------------------------------------------"
" Telescope - Treesitter {{{
"-----------------------------------------------"
" builtin.treesitter - Lists Function names, variables, from Treesitter!one
nnoremap ,tr <cmd>lua require('telescope.builtin').treesitter()<cr>
"
" }}} Telescope - Treesitter


"-----------------------------------------------"
" Telescope - Vim objects {{{
"-----------------------------------------------"
" builtin.autocommands - Lists vim autocommands and goes to their declaration on <cr>
nnoremap ,au <cmd>lua require('telescope.builtin').autocommands()<cr>

" builtin.buffers - Lists open buffers in current neovim instance
nnoremap ,b <cmd>lua require('telescope.builtin').buffers()<cr>

" builtin.current_buffer_fuzzy_find - Live fuzzy search inside of the currently open buffer
nnoremap ,cbff <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

" builtin.current_buffer_tags - Lists all of the tags for the currently open buffer, with a preview
nnoremap ,cbt <cmd>lua require('telescope.builtin').current_buffer_tags()<cr>

" builtin.commands - Lists available plugin/user commands and runs them on <cr>
nnoremap ,co <cmd>lua require('telescope.builtin').commands()<cr>

" builtin.command_history - Lists commands that were executed recently, and reruns them on <cr>
nnoremap ,ch <cmd>lua require('telescope.builtin').command_history()<cr>

" builtin.colorscheme - Lists available colorschemes and applies them on <cr>
nnoremap ,cs <cmd>lua require('telescope.builtin').colorscheme()<cr>

" " builtin.filetypes - Lists all available filetypes
nnoremap ,ft <cmd>lua require('telescope.builtin').filetypes()<cr>

" builtin.highlights - Lists all available highlights
nnoremap ,hi <cmd>lua require('telescope.builtin').highlights()<cr>

" builtin.help_tags - Lists available help tags and opens a new window with the relevant help info on <cr>
nnoremap ,ht <cmd>lua require('telescope.builtin').help_tags()<cr>

" builtin.jumplist - Lists Jump List entries
nnoremap ,jl <cmd>lua require('telescope.builtin').jumplist()<cr>

" builtin.keymaps - Lists normal mode keymappings
nnoremap ,km <cmd>lua require('telescope.builtin').keymaps()<cr>

" builtin.loclist - Lists items from the current window's location list
nnoremap ,ll <cmd>lua require('telescope.builtin').loclist()<cr>

" builtin.man_pages - Lists manpage entries, opens them in a help window on <cr>
nnoremap ,mn <cmd>lua require('telescope.builtin').man_pages()<cr>

" builtin.marks - Lists vim marks and their value
nnoremap ,mk <cmd>lua require('telescope.builtin').marks()<cr>

" builtin.oldfiles - Lists previously open files
nnoremap ,of <cmd>lua require('telescope.builtin').oldfiles()<cr>

" builtin.quickfix - Lists items in the quickfix list
nnoremap ,qf <cmd>lua require('telescope.builtin').quickfix()<cr>

" builtin.registers - Lists vim registers, pastes the contents of the register on <cr>
nnoremap ,rg <cmd>lua require('telescope.builtin').registers()<cr>

" builtin.search_history - Lists searches that were executed recently, and reruns them on <cr>
nnoremap ,sh <cmd>lua require('telescope.builtin').search_history()<cr>

" builtin.spell_suggest - Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>
nnoremap ,ss <cmd>lua require('telescope.builtin').spell_suggest()<cr>

" builtin.tags - Lists tags in current directory with tag location file preview (users are required to run ctags -R to generate tags or update when introducing new changes)
nnoremap ,ta <cmd>lua require('telescope.builtin').tags()<cr>

" builtin.vim_options - Lists vim options, allows you to edit the current value on <cr>
nnoremap ,vi <cmd>lua require('telescope.builtin').vim_options()<cr>

" }}} Telescope - Vim objects


"----------------------------------------#
"    UndoTree {{{                        #
"----------------------------------------#
nnoremap <leader>5 :UndotreeToggle<cr>
" }}} UndoTree


" vim: ft=vim
