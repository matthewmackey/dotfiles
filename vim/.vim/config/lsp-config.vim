lua << EOF
  local nvim_lsp = require('lspconfig')

  print('Loaded [lspconfig]')
  -- Custom on attach function
  local mm_lsp_on_attach = function(client, bufnr)
    -- Indicate when language server is ready
    print('Language server is ready')
  end

EOF

