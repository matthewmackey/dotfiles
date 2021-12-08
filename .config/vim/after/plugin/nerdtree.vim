""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - NERDTree                                                "
"                                                                              "
"      See - https://github.com/preservim/nerdtree                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1                      " show bookmarks on startup
let NERDTreeShowHidden=1                         " show hidden files

"['\.d$[[dir]]', '\.o$[[file]]', 'tmp/cache$[[path]]']
let NERDTreeIgnore=['.git$[[dir]]']

nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <Leader>r :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window on Vim startup
" autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close tab if NERDTree is the only window remaining in the tab, UNLESS it is the 1st tab
autocmd BufEnter * if tabpagenr('$') != 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" CAN't seem to get this to work right:
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"---------------------------------------------"
" NERDTree-related plugin config
"---------------------------------------------"
" SEE: https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
let g:NERDTreeLimitedSyntax = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
