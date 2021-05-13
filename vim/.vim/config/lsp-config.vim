

lua << EOF
  -------------------------------------------------------------------------------
  -- General LSP Help:
  --   - https://neovim.io/doc/user/lsp.html#lsp-handler
  --   - :help lsp
  -------------------------------------------------------------------------------
  local nvim_lsp = require('lspconfig')

  -- Custom on attach function
  local on_attach = function(client, bufnr)
    -- Setup omnitab completion
    vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

    -- Indicate when language server is ready
    print('Language server is ready')
  end

  -------------------------------------------------------------------------------
  -- LSP Hander Help:
  --   - https://neovim.io/doc/user/lsp.html#lsp-handler
  --   - :help lsp-handler-configuration
  -------------------------------------------------------------------------------
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
       -- Enable/Disable signs
       -- See |vim.lsp.diagnostic.set_signs()|
       signs = true,

       -- Enable/Disable underline
       -- See |vim.lsp.diagnostic.set_underline()|
       underline = false,

       -- Update diagnostics in InsertMode or wait until InsertLeave
       update_in_insert = false,

       -- Enable/Disable virtual_text
       -- See |vim.lsp.diagnostic.set_virtual_text()|
       virtual_text = false,
    }
  )

  -------------------------------------------------------------------------------
  -- LSP Sign Definitions
  --   - https://neovim.io/doc/user/sign.html
  --   - :help vim.lsp.diagnostic.set_signs()
  -------------------------------------------------------------------------------
  vim.cmd('sign define LspDiagnosticsSignError       text=E linehl= numhl= texthl=LspDiagnosticsSignError')
  vim.cmd('sign define LspDiagnosticsSignWarning     text=W linehl= numhl= texthl=LspDiagnosticsSignWarning')
  vim.cmd('sign define LspDiagnosticsSignInformation text=I linehl= numhl= texthl=LspDiagnosticsSignInformation')
  vim.cmd('sign define LspDiagnosticsSignHint        text=H linehl= numhl= texthl=LspDiagnosticsSignHint')

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

  -- typescript
  nvim_lsp.tsserver.setup {
    on_attach = on_attach,
  }

  -- Golang
  nvim_lsp.gopls.setup {
    on_attach = on_attach,
  }

EOF

