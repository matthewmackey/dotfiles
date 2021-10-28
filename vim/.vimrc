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

"----------------------------------------------
" Local-overrides
"----------------------------------------------
runtime .vimrc-local


"---------------------------------------------------------------
" NOTES - things I can't remember from Help Pages
"---------------------------------------------------------------
"
"--------------------------------
" Ex-mode w/ command-line window
" From: Vim Help Pages
"--------------------------------
" OPEN						*c_CTRL-F* *q:* *q/* *q?*

" There are two ways to open the command-line window:
" 1. From Command-line mode, use the key specified with the 'cedit' option.
"    The default is CTRL-F when 'compatible' is not set.
" 2. From Normal mode, use the "q:", "q/" or "q?" command.
"    This starts editing an Ex command-line ("q:") or search string ("q/" or
"   "q?").  Note that this is not possible while recording is in progress (the
"   "q" stops recording then).
