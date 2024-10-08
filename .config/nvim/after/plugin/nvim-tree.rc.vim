lua <<EOF
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {

  -- This specific combo for the following 2x settings seem to be what is needed to get
  -- the `gx` shortcut to open the URL under the cursor in a browser properly.
  --
  -- It seems like netrw is a Vim plugin that provides the functionality of `gx`
  -- to open URLs, so it needs to be enabled (??).
  --
  -- SEE:
  --   - https://github.com/nvim-tree/nvim-tree.lua/issues/226
  --   - https://stackoverflow.com/questions/39510377/how-to-make-the-gx-command-work-for-urls-in-vim-on-xfce4-desktop
  disable_netrw       = false,
  hijack_netrw        = true,

  -- Keeps the cursor on the first letter of the filename when moving in the tree.
  hijack_cursor       = true,

  -- hijacks new directory buffers when they are opened (`:e dir`).
  hijack_directories  = {
    enable = false,

    -- Opens the tree if the tree was previously closed.
    auto_open = false,
  },

  ignore_ft_on_setup  = {},

  -- Will automatically open the tree when running setup if startup buffer is
  -- a directory, is empty or is unnamed. nvim-tree window will be focused.
  open_on_setup       = true,

  -- Will automatically open the tree when running setup if startup buffer is a file.
  -- File window will be focused.
  open_on_setup_file  = true,

  open_on_tab         = true,

  -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  respect_buf_cwd     = false,

  -- Changes the tree root directory on `DirChanged` and refreshes the tree.
  sync_root_with_cwd  = false,

  actions = {
    use_system_clipboard = true,
    open_file = {
      -- 0 by default, closes the tree when you open a file
      quit_on_open = false,

      resize_window = true,

      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",

        -- Dictionary of buffer option names mapped to a list of option values that
        -- indicates to the window picker that the buffer's window should not be
        -- selectable.
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },

  diagnostics = {
    enable = false,
    icons = {
      error = "",
      warning = "",
      info = "",
      hint = "",
    },
  },

  filters = {
    dotfiles = false,
    custom = {},
  },

  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },

  renderer = {
    -- 0 by default, append a trailing slash to folder names
    add_trailing = true,

    full_name = false,

    -- 0 by default, compact folders that only contain a single folder into one node in the file tree
    group_empty = true,

    highlight_git = false,

    -- 0 by default, will enable folder and file icon highlight for opened files/directories.
    -- Value can be `"none"`, `"icon"`, `"name"` or `"all"`.
    highlight_opened_files = "icon",

    icons = {
      git_placement = "before",

      -- default will show icon by default if no icon is provided
      -- default shows no icon by default
      glyphs = {

        default = "",
        bookmark = "",
        symlink = "",

        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },

        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },

      -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
      padding = " ",

      -- If 0, do not show the icons for one of 'git' 'folder' and 'files'
      -- 1 by default, notice that if 'files' is 1, it will only display
      -- if nvim-web-devicons is installed and on your runtimepath.
      -- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
      -- but this will not work when you set indent_markers (because of UI conflict)
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      -- ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
      symlink_arrow = " ➛ ",

      webdev_colors = true,
    },

    indent_markers = {
      -- 0 by default, this option shows indent markers when folders are open
      enable = false,

      icons = {
        bottom = "─",
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },

      inline_arrows = true,
    },

    indent_width = 2,

    -- This is the default. See :help filename-modifiers for more options
    root_folder_modifier = ":~",

    --  List of filenames that gets highlighted with NvimTreeSpecialFile
    special_files = {
      "Cargo.toml",
      "Makefile",
      "README.md",
      "readme.md",
      "TODO",
      "TODO.md"
    },

    symlink_destination = true,
  },

  system_open = {
    cmd  = nil,
    args = {},
  },

  -- Update the focused file on `BufEnter`, un-collapses the folders recursively
  -- until it finds the file.
  update_focused_file = {
    enable      = true,
    ignore_list = {},

    -- Update the root directory of the tree if the file is not under current
    -- root directory. It prefers vim's cwd and `root_dirs`.
    update_cwd  = false,
  },

  view = {
    width = 35,
    -- Not a valid setting anymore (??)
    -- height = 30,

    hide_root_folder = false,
    side = "left",

    -- Keybindings
    mappings = {
      custom_only = false,
      list = {
        { key = "u",  action = "dir_up" },
      },
    },

    -- Side Gutter Settings --
    number = true,
    relativenumber = false,
    signcolumn = "no",   -- yes, no, or auto
  },

  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}
EOF

" this variable must be enabled for colors to be applied properly
"
" To get this setting to work w/ Alacritty, I had to set TERM=alacritty in
" alacritty.yml; see:
"
"   - https://www.reddit.com/r/vim/comments/kennw5/termguicolors_disabling_all_text_colors_in/
set termguicolors

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeSymlink guifg=blue gui=bold,underline

" vim: ft=lua
