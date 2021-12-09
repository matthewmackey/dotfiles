lua <<EOF
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
    },
  },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF

nnoremap <silent> ,f <cmd>Telescope find_files<CR>
nnoremap <silent> ,g <cmd>Telescope live_grep<CR>
nnoremap <silent> ,b <cmd>Telescope buffers<CR>
nnoremap <silent> ,h <cmd>Telescope help_tags<CR>

" vim: set ft=lua
