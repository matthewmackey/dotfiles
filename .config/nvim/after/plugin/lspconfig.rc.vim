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
end

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  filetypes = { "python" }
}
EOF

" vim: ft=lua :
