" 1st test: naive test to see if base16-vim is installed to avoid error message
"           on 1st vim startup before plugins installed the 1st time
if filereadable(expand("~/.local/share/nvim/plugged/base16-vim/colors/base16-seti.vim"))
      \ && filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  set background=light
  source ~/.vimrc_background
endif

" Must be after sourcing ~/.vimrc_background to override for all colorschemes
" highlight ColorColumn ctermbg=None cterm=underline
highlight ColorColumn ctermbg=DarkGray

" colorscheme default
