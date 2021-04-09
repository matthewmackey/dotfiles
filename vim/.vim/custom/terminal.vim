"  From: https://github.com/bluz71/dotfiles/blob/master/vim/custom/terminal.vim
" Note, the following settings are for terminal Vim only. Neovim and GUI Vim do
" not require these settings.
"
if !has('gui_running') && !has('nvim')
    set term=xterm-256color " Vim does not like TERM=alacritty
    set ttyfast             " Indicate fast terminal conn for faster redraw
    set ttymouse=xterm2     " Indicate terminal type for mouse codes
    set ttyscroll=3         " Speedup scrolling
    " if tmux
    if &term ==# 'tmux-256color'
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        " Make Vim *set termguicolors* work inside tmux.
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " else not tmux
    else
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
    endif
endif

