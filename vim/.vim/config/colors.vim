""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Color Scheme                                     "
"                                                                              "
" base16-shell creates Vim colorscheme file at ~/.vimrc_background             "
"                                                                              "
" From - https://github.com/chriskempson/base16-shell                          "
" From - https://csswizardry.com/2017/03/configuring-git-and-vim/              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" 1st test: naive test to see if base16-vim is installed to avoid error message
"           on 1st vim startup before plugins installed the 1st time
if filereadable(expand("~/.vim/plugged/base16-vim/colors/base16-seti.vim"))
      \ && filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  set background=light
  source ~/.vimrc_background
endif

" Must be after sourcing ~/.vimrc_background to override for all colorschemes
highlight ColorColumn ctermbg=gray

" Toggle the colorcolumn on/off
"
" NOTE - the +1 sets colorcolumn to +1 of current textwidth value;
"        the normal textwidth set in the general settings is 80
noremap <F5> :windo exec (&colorcolumn == '0' ? ':set colorcolumn=+1' : ':set colorcolumn=0')<CR>

"---------------------"
"   Git with Vim      "
"---------------------"
" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

