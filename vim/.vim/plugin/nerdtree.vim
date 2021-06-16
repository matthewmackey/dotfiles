""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - NERDTree                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1                      " show bookmarks on startup
let NERDTreeShowHidden=1                         " show hidden files

let NERDTreeIgnore=['.git$[[dir]]']
"['\.d$[[dir]]', '\.o$[[file]]', 'tmp/cache$[[path]]']
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>nr :NERDTreeToggle %<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

