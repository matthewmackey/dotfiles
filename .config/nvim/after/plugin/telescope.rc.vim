nnoremap <silent> ,f <cmd>Telescope find_files<CR>
nnoremap <silent> ,r <cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <cmd>Telescope buffers<CR>
nnoremap <silent> ,; <cmd>Telescope help_tags<CR>

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
