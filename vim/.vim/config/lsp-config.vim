lua << EOF
  local nvim_lsp = require('lspconfig')

  -- Custom on attach function
  local lsp_on_attach = function(client, bufnr)
    -- Indicate when language server is ready
    print('Language server is ready')
  end

  -------------------------------------------------------------------------------
  -- Setup: Language Servers
  -------------------------------------------------------------------------------
  -- Use a loop to both setup defined servers and map buffer local keybindings
  -- when the language server attaches
  local servers = { "gopls", "tsserver" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = lsp_on_attach }
  end
EOF

