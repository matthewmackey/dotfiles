" SEE: https://bluz71.github.io/2018/12/04/fuzzy-finding-in-vim-with-fzf.html

nnoremap <silent> <Leader><Space> :Files<CR>

" Fuzzy find files in same dir as current file
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :GFiles?

" Naive test: looks like a React app, add React specific mappings here
if filereadable('src/index.js')
  nnoremap <silent> <Leader>ec :Files src/components<CR>
  nnoremap <silent> <Leader>et :Files src/__tests__/components<CR>
endif
