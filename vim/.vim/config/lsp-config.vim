
lua << EOF
  local nvim_lsp = require('lspconfig')

  -- Custom on attach function
  local lsp_on_attach = function(client, bufnr)
    -- Setup omnitab completion
    vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

    -- Indicate when language server is ready
    print('Language server is ready')
  end

  -------------------------------------------------------------------------------
  -- Setup Language Servers
  -------------------------------------------------------------------------------
  -- tsserver: (https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver)
  --
  --   Default Values:
  --     cmd = { "typescript-language-server", "--stdio" }
  --     filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
  --     root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
  --
  nvim_lsp.tsserver.setup {
    on_attach = lsp_on_attach,
  }

EOF

