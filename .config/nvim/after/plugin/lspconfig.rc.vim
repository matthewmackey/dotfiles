if !exists('g:lspconfig')
  finish
endif

lua <<EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local util = require('lspconfig.util')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap = true, silent = true }

    -- Enable omnicompletion
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<Leader>,ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<Leader>,D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<Leader>,e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<Leader>,f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<Leader>,q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<Leader>,r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    -- Auto-format on save (if available)
    if client.resolved_capabilities.document_formatting then
       vim.api.nvim_command [[augroup Format]]
       vim.api.nvim_command [[autocmd! * <buffer>]]
       vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
       vim.api.nvim_command [[augroup END]]
    end

    print "LSP Server loaded"

    --protocol.SymbolKind = { }
    -- [NOT Working] not sure why??
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

    -- Highlight symbol under cursor --
    --
    -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#highlight-symbol-under-cursor
    if client.resolved_capabilities.document_highlight then
        --  hi LspReferenceRead ctermbg=red guibg=Cyan
        vim.cmd [[
          hi LspReferenceRead cterm=bold gui=underline
          hi LspReferenceText cterm=bold gui=underline
          hi LspReferenceWrite cterm=bold gui=underline
          augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]]
    end
end


-- Configure virtual_text --
--
-- See :help vim.diagnostic.config
vim.diagnostic.config({
    virtual_text = false,
    -- virtual_text = {
    --     prefix = '●', -- Could be '■', '▎', 'x'
    --     source = "always",  -- Or "if_many"
    -- },
    float = {
        source = "always",  -- Or "if_many"
    },
    severity_sort = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})


-- Show line diagnostics automatically in hover window when cursor on issue --
--
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]


-- Highlight line number instead of having icons in sign column --
--
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#highlight-line-number-instead-of-having-icons-in-sign-column
-- vim.cmd [[
--     highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
--     highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
--     highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
--     highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

--     sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
--     sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
--     sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
--     sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
-- ]]


-- Change diagnostic symbols in sign column (gutter )--
--
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- JAVASCRIPT
-- npm install -g typescript typescript-language-server eslint prettier
nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim"
    },
    on_attach = on_attach,
    root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    settings = {
        python = {
            analysis = {
                autosearchpaths = true,
                diagnosticmode = "workspace",
                extrapaths = {"./src/main/python"},
                loglevel = "information",
                uselibrarycodefortypes = true
            }
        }
    }
}

-- PYTHON
-- npm install -g pyright
nvim_lsp.pyright.setup {
    capabilities = capabilities,
    filetypes = { "python" },
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autosearchpaths = true,
                diagnosticmode = "workspace",
                extrapaths = {"./src/main/python"},
                loglevel = "information",
                uselibrarycodefortypes = true
            }
        }
    }
}
EOF
" vim: ft=lua tabstop=4 softtabstop=4 shiftwidth=4:
