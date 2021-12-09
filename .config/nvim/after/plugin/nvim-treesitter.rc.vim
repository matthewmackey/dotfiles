if !exists('g:loaded_nvim_treesitter')
  finish
endif

lua <<EOF
local nt_configs = require('nvim-treesitter.configs')

nt_configs.setup {
  highlight= {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "hcl",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "lua",
    "php",
    "python",
    "regex",
    "ruby",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  }
}
EOF

