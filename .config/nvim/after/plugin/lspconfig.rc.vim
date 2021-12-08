if !exists('g:lspconfig')
  finish
endif

lua <<EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap = true, silent = true }

  -- Enable omnicompletion
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  -- Auto-format on save (if available)
  if client.resolved_capabilities.document_formatting then
     vim.api.nvim_command [[augroup Format]]
     vim.api.nvim_command [[autocmd! * <buffer>]]
     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
     vim.api.nvim_command [[augroup END]]
  end

  print "LSP Server loaded"

  --protocol.SymbolKind = { }
  -- NOT Working: not sure why??
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.pyright.setup {
  capabilities = capabilities,
  filetypes = { "python" },
  on_attach = on_attach,
}
EOF

" vim: ft=lua :
