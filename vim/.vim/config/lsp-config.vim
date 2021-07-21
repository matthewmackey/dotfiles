
if has('nvim')
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

      -- From: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local opts = { noremap=true, silent=true }
      buf_set_keymap('n', 'gD',        '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd',        '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K',         '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi',        '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<space>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr',        '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e',  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      buf_set_keymap('n', '[d',        '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d',        '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q',  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      buf_set_keymap("n", "<space>f",  "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

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

    -- Golang
    nvim_lsp.gopls.setup {
      on_attach = on_attach,
    }

    -- Python
    nvim_lsp.pyright.setup{
      on_attach = on_attach,
    }

    -- Ruby
    nvim_lsp.solargraph.setup{
      on_attach = on_attach,
    }

    -- Typescript
    nvim_lsp.tsserver.setup {
      on_attach = on_attach,
    }

  -- ################################################
  -- # Compe setup                                  #
  -- ################################################
  -- SEE: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
  -- SEE: https://github.com/hrsh7th/nvim-compe
    vim.o.completeopt = "menuone,noselect"

    require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
      };
      source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;

        nvim_lua = false;
        vsnip = false;
        ultisnips = false;
        luasnip =false;
      };
    }

    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            return true
        else
            return false
        end
    end

    -- Use (s-)tab to:
    --- move to prev/next item in completion menuone
    --- jump to prev/next snippet's placeholder
    _G.tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
      elseif check_back_space() then
        return t "<Tab>"
      else
        return vim.fn['compe#complete']()
      end
    end
    _G.s_tab_complete = function()
      if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
      else
        return t "<S-Tab>"
      end
    end

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" highlight link CompeDocumentation NormalFloat

endif


