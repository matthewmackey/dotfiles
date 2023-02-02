""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             Plugin - vim-go                                                  "
"    (https://github.com/fatih/vim-go-tutorial/blob/master/vimrc)              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------------------------------------
" General
"------------------------------------------------------------
let g:go_autodetect_gopath = 1
"let g:go_list_type = "quickfix"
"let g:go_auto_sameids = 1 " Highlight instances of variable under cursor

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" I want to turn off end-of-line virtual text and have tried disabling these
" here but it doesn't seem to work.  It seems like the ALE plugin is controlling
" that text.  I'm leaving them disabled anyways for now.
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0

" Specifies the `gopls` diagnostics level. Valid values are 0, 1, and 2. 0
" ignores `gopls` diagnostics, 1 is for errors only, and 2 is for errors and
" warnings. By default it is 0.
" let g:go_diagnostics_level = 0

" Use this option to change default path for vim-go tools when using
" |:GoInstallBinaries| and |:GoUpdateBinaries|. If not set `go env GOBIN` or
" `$GOPATH/bin` is used.
" let g:go_bin_path = ""

"Show the name of each failed test before the errors and logs output by the
"test. By default it is disabled.
let g:go_test_show_name = 1

" Use this option to use the popup-window for |K| and |:GoDoc|, rather than the
" |preview-window|. Default is disabled.
let g:go_doc_popup_window = 1


"------------------------------------------------------------
" Debug
"------------------------------------------------------------
" A list of options to debug; useful for development and/or reporting bugs.
"
" Currently accepted values:
"
"   shell-commands     Echo all shell commands that vim-go runs.
"   debugger-state     Expose debugger state in 'g:go_debug_diag'.
"   debugger-commands  Echo communication between vim-go and `dlv`; requests and
"                      responses are recorded in `g:go_debug_commands`.
"   lsp                Echo communication between vim-go and `gopls`. All
"                      communication is shown in a dedicated window. When
"                      enabled before gopls is started, |:GoLSPDebugBrowser| can
"                      be used to open a browser window to help debug gopls.
"
" shell-commands - Print any shell commands that are run by vim-go (like :GoMetaLinter) to `:messages`
let g:go_debug=[]
" let g:go_debug=['shell-commands']
" let g:go_debug=['lsp', 'shell-commands']


"------------------------------------------------------------
" :AsmFmt
"------------------------------------------------------------
" Use this option to auto |:AsmFmt| on save. By default it's disabled.
let g:go_asmfmt_autosave = 1


"------------------------------------------------------------
" :GoDef
"------------------------------------------------------------
" Use this option to define the command to be used for |:GoDef|. By default
" `gopls` is used, because it is the fastest. One might also use `guru` for its
" accuracy or `godef` for its performance. Valid options are `godef`, `gopls`,
" and `guru`.
let g:go_def_mode = 'gopls'


"------------------------------------------------------------
" :GoFmt
"------------------------------------------------------------
" Use this option to define which tool is used to format code. Valid options are
" `gofmt`, `goimports`, and `gopls`. By default `gopls` is used.
let g:go_fmt_command = "goimports"

" Use this option to auto |:GoFmt| on save. When both 'g:go_imports_autosave'
" and 'g:go_fmt_autosave' are enabled and both 'g:go_fmt_command' and
" 'g:go_imports_mode' are set to `goimports`, `goimports` will be run only once.
" By default it's enabled.
let g:go_fmt_autosave = 1


"------------------------------------------------------------
" :GoImports
"------------------------------------------------------------
" Use this option to auto |:GoImports| on save. When both
" 'g:go_imports_autosave' and 'g:go_fmt_autosave' are enabled and both
" 'g:go_fmt_command' and 'g:go_imports_mode' are set to `goimports`, `goimports`
" will be run only once. By default it's enabled.
let g:go_imports_autosave = 1

" Use this option to define which tool is used to adjust imports. Valid options
" are `goimports` and `gopls`. The buffer will not be formatted when this is set
" to `gopls`. By default `gopls` is used.
let g:go_imports_mode = 'gopls'


"------------------------------------------------------------
" :GoInfo
"------------------------------------------------------------
" Use this option to define the command to be used for |:GoInfo|. By default
" `gopls` is used, because it is the fastest and is known to be highly accurate.
" One might also use `guru` for its accuracy.
" Valid options are `gopls` and `guru`.
let g:go_info_mode = 'gopls'

" Use this option to show the type info (|:GoInfo|) for the word under the
" cursor automatically. Whenever the cursor changes the type info will be
" updated. By default it's disabled. The delay can be configured with the
" |'g:go_updatetime'| setting.
let g:go_auto_type_info = 0

"
"------------------------------------------------------------
" :GoInstallBinaries
"------------------------------------------------------------
" These are the binares installed by :GoInstallBinaries as of 2/2/23.
" This is a code excerpt from:
"
"   - https://github.com/fatih/vim-go/blob/master/plugin/go.vim#L42)
"
" let s:packages = {
"   \ 'asmfmt':        ['github.com/klauspost/asmfmt/cmd/asmfmt@latest'],
"   \ 'dlv':           ['github.com/go-delve/delve/cmd/dlv@latest'],
"   \ 'errcheck':      ['github.com/kisielk/errcheck@latest'],
"   \ 'fillstruct':    ['github.com/davidrjenni/reftools/cmd/fillstruct@master'],
"   \ 'godef':         ['github.com/rogpeppe/godef@latest'],
"   \ 'goimports':     ['golang.org/x/tools/cmd/goimports@master'],
"   \ 'golangci-lint': ['github.com/golangci/golangci-lint/cmd/golangci-lint@latest'],
"   \ 'gomodifytags':  ['github.com/fatih/gomodifytags@latest'],
"   \ 'gopls':         ['golang.org/x/tools/gopls@latest', {}, {'after': function('go#lsp#Restart', [])}],
"   \ 'gorename':      ['golang.org/x/tools/cmd/gorename@master'],
"   \ 'gotags':        ['github.com/jstemmer/gotags@master'],
"   \ 'guru':          ['golang.org/x/tools/cmd/guru@master'],
"   \ 'iferr':         ['github.com/koron/iferr@master'],
"   \ 'impl':          ['github.com/josharian/impl@main'],
"   \ 'keyify':        ['honnef.co/go/tools/cmd/keyify@master'],
"   \ 'motion':        ['github.com/fatih/motion@latest'],
"   \ 'revive':        ['github.com/mgechev/revive@latest'],
"   \ 'staticcheck':   ['honnef.co/go/tools/cmd/staticcheck@latest'],
" \ }


"------------------------------------------------------------
" :GoMetaLinter
"------------------------------------------------------------
" `vet` is a built-in Go tool (ie - `go vet` OR `go tool vet`)
" DEFAULT:
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golangci-lint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golangci-lint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"


"------------------------------------------------------------
" :GoModFmt
"------------------------------------------------------------
" Use this option to auto |:GoModFmt| on save. By default it's enabled.
let g:go_mod_fmt_autosave = 1


"------------------------------------------------------------
" Key Bindings
"------------------------------------------------------------
" TODO: figure out a way to map these elsewhere b/c I currently use Vim's `1<C-g>` keymapping
"
" Open :GoDeclsDir with ctrl-g
" nmap <C-g> :GoDeclsDir<cr>
" imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  "
  " TODO: figure out why this is not getting triggered when file is opened from
  " command-line but only it `:e` is run or if it is opened from nvim-tree
  "
  " (first three lines are debug statements)
  " autocmd BufWinEnter *.go echomsg "BufWinEnter - " . strftime("%c")
  " autocmd BufNewFile *.go echomsg "BufNewFile - " . strftime("%c")
  " autocmd BufRead *.go echomsg "BufRead - " . strftime("%c")
  " autocmd FileType go echomsg "FileType go - " . strftime("%c")
  autocmd BufNewFile,BufRead *.go setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

  " :GoBuild and :GoTestCompile
  "
  " NEED the nnoremap here b/c otherwise whenever this keymapping was entered,
  " all that would happen is that `<SNR>135_build_go_files()` would get printed
  " ad the top of the file it was called from
  "
  " TODO: figure out where the potential conflicting keymapping is to prevent recursion (??)
  autocmd FileType go nnoremap <leader>b :call <SID>build_go_files()<CR>

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoDocBrowser
  autocmd FileType go nmap <Leader>d <Plug>(go-doc-browser)

  " :GoDoc
  autocmd FileType go nmap <Leader>D <Plug>(go-doc)

  " :GoFmt
  autocmd FileType go nnoremap <Leader>gf :GoFmt<CR>

  " :GoLint
  autocmd FileType go nnoremap <Leader>gl :GoLint<CR>

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>gm <Plug>(go-metalinter)

  " NOT DOING b/c we use `let g:go_auto_type_info = 1`
  " " :GoInfo
  " autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoSameIdsToggle
  autocmd FileType go nnoremap <Leader>i :GoSameIdsToggle<CR>

  " :GoDecls
  autocmd FileType go nmap <leader>ll <Plug>(go-decls)

  " :GoDeclsDir
  autocmd FileType go nmap <leader>ld <Plug>(go-decls-dir)

  " :GoRun
  autocmd FileType go nmap <leader>r <Plug>(go-run)

  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  "
  " :GoTest
  autocmd FileType go nmap <leader>t <Plug>(go-test)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang GoAlternate call go#alternate#Switch(<bang>0, 'edit')

  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang GoAlternateSplit call go#alternate#Switch(<bang>0, 'split')

  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  autocmd Filetype go command! -bang GoAlternateTab call go#alternate#Switch(<bang>0, 'tabe')

  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang GoAlternateVsplit call go#alternate#Switch(<bang>0, 'vsplit')

  autocmd FileType go nnoremap <Leader>al :GoAlternate<CR>
  autocmd FileType go nnoremap <Leader>as :GoAlternateSplit<CR>
  autocmd FileType go nnoremap <Leader>at :GoAlternateTab<CR>
  autocmd FileType go nnoremap <Leader>av :GoAlternateVsplit<CR>
augroup END


"------------------------------------------------------------
" Helper Functions
"------------------------------------------------------------
" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
