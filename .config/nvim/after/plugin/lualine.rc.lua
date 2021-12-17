local status, lualine = pcall(require, 'lualine')

if (not status) then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        sources={'nvim_lsp'},
        sections = {'error', 'warn', 'info', 'hint'},
        diagnostics_color = {
          -- Same values like general color option can be used here.
          error = 'DiagnosticError', -- changes diagnostic's error color
          warn  = 'DiagnosticWarn',  -- changes diagnostic's warn color
          info  = 'DiagnosticInfo',  -- Changes diagnostic's info color
          hint  = 'DiagnosticHint',  -- Changes diagnostic's hint color
        },
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        colored = true, -- displays diagnostics status in color if set to true
        update_in_insert = false, -- Update diagnostics in insert mode
        always_visible = false, -- Show diagnostics even if count is 0, boolean or function returning boolean
      },
    },
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true, -- shows shortened relative path when false
        show_modiied_status = true, -- shows indicator then buffer is modified
        mode = 2, -- 0 shows buffer name
                  -- 1 buffer index (bufnr)
                  -- 2 shows buffer name + buffer index (bufnr)
        max_length = vim.o.columns * 2 / 3, -- maximum width of buffers component
                                            -- can also be a function that returns value of max_length dynamicaly
        filetype_names = {
          NvimTree = 'File Manager',
          TelescopePrompt = 'Telescope',
          -- dashboard = 'Dashboard',
          -- fzf = 'FZF',
        }, -- shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
        buffers_color = {
          -- Same values like general color option can be used here.
          active = 'lualine_a_normal',
          inactive = 'lualine_b_inactive',
        },
      },
    },
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        max_length = vim.o.columns / 3,
        mode = 0,
        tabs_color = {
          -- Same values like general color option can be used here.
          -- Not sure why, but using section 'a' for active and 'b' for inactive works
          active = 'lualine_a_normal',
          inactive = 'lualine_b_inactive',
        },
      },
    },
  },
  extensions = {'fugitive'}
}
