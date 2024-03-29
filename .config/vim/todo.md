# Desired Vim Features

- fast as hell :)
- active window highlighted
- language-specific motions for selecting things like functions
  - Comment out function
- multi-cursor
- auto-formatting of language files on save
- auto management of imports
- scratch windows
- easily zoom current window to max
- fuzzy finding buffers/windows/files/etc.
- auto-eliminate trailing whitespace on save
- show some sort of tab/indention indicator like in SpaceVim
- allow file tree to be different on different tabs
- intellisense that allows fuzz-finding of completions before printing
  completion to buffer
- search:
  - word under cursor
  - across all files in project
- See keybindings on "Giving Vim Superpowers" Vimconf 2021 talk
- Project-wide refactorings
- Change word in camelCase or underscore separated words will only change the
  word b/w the underscores or at the change in cases
  - Conversely, when doing autocompletions, ensure that entire
    underscore-separated words are treated as single words for completion
  - Also, when doing word navigation on an underscore-separated word, like a
    Python function name, we have the option of navigating by each word b/w
    underscores or not
- Increase key repeat speed (OS level change)
- Plugin that turns quickfix window into a buffer w/ operations
- Implement vim sessions
x cursorline is just underline vs highlight
- Ability to select inner quotes from anywhere on line

- Clean-up hard-coded ~/.vim / ~/.config/vim paths in \*.vim files
- Ensure all if('nvim') code is moved to ~/.config/nvim
- Markdown text objects and functionality
- Figure out how to take advantage of Treesitter indent and incremental
  selection

- Review plugins described here for possible use: https://alpha2phi.medium.com/neovim-lsp-enhanced-a3d313abee65


Desired Shortcuts
=================
- Add blank line above w/o entering insert mode (ie - 'O')
- auto-indent brackets & cursor when coding
x auto-close brackets/parens/etc.
x keep visual selection after operation
x move multiple lines up and down easily
- Command to move line/visual selection up or down (multiple times easily w/o numeric modifiers;
  ie - like repeat-time in Tmux)
x Remap ESC to Caps Lock (either at OS or in Vim)



Utilities to install
===================
- lf
  - setup autocomplete and lfcd() function
  - SEE: https://github.com/gokcehan/lf/tree/master/etc
- vifm
- dust
- bat
- exa
