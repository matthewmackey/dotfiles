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

runtime config/autocmds.vim
runtime config/keymappings.vim
runtime config/functions.vim

"----------------------------------------------
" Plugin Management
"   Configs -> auto-sourced via: ~/dotfiles/vim/plugin/*
"----------------------------------------------
runtime config/plugin-management.vim
runtime config/lsp-config.vim

"----------------------------------------------
" Colors
"----------------------------------------------
runtime config/colors.vim

