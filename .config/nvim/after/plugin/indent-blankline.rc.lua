vim.opt.list = false
vim.opt.listchars = ("eol:↴")

-- Enable if you want different colors on each indent
-- vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
    char = '│',
    context_char = '┃',
    filetype_exclude = {"help"},
    indent_level = 4,
    max_indent_increase = 1,
    show_current_context = false,
    show_current_context_start = false,
    show_end_of_line = false,
    show_first_indent_level = true,
    show_trailing_blankline_indent = false,
    space_char_blankline = " ",
    use_treesitter = true,
    -- Enable if you want different colors on each indent
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    --     "IndentBlanklineIndent3",
    --     "IndentBlanklineIndent4",
    --     "IndentBlanklineIndent5",
    --     "IndentBlanklineIndent6",
    -- },
}
