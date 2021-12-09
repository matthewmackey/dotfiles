lua <<EOF
local actions = require('telescope.actions')

require('telescope').setup {
  dejaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
}
EOF

nnoremap <silent> ,f <cmd>Telescope find_files<CR>
nnoremap <silent> ,g <cmd>Telescope live_grep<CR>
nnoremap <silent> ,b <cmd>Telescope buffers<CR>
nnoremap <silent> ,h <cmd>Telescope help_tags<CR>

" vim: set ft=lua
