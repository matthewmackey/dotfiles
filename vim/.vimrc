"-------------------------------------------------------------------------------
" See:
"   - https://github.com/bluz71/dotfiles
"   - https://github.com/nathunsmitty/.config/blob/main/nvim/init.vim
"-------------------------------------------------------------------------------

"----------------------------------------------
" General settings
"----------------------------------------------
runtime config/general.vim
runtime config/clipboard.vim
runtime config/whitespace.vim
runtime config/terminal.vim

"----------------------------------------------
" Key Mappings
"----------------------------------------------
runtime config/keymappings.vim

"----------------------------------------------
" Custom Functions
"----------------------------------------------
runtime config/functions.vim

"----------------------------------------------
" Plugin Management
"   Configs -> auto-sourced via: ~/dotfiles/vim/plugin/*
"----------------------------------------------
runtime config/plugin-management.vim

" Load Neovim Lua-based plugin configurations.
if has('nvim')
  " Do not load up certain plugins when in diff mode.
  if !&diff
    lua require'lsp-config'
  endif
endif

"----------------------------------------------
" Colors
"----------------------------------------------
runtime config/colors.vim

