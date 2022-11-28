if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

lua <<EOF
require('usermod.settings')
EOF

" call glaive#Install()
" Glaive codefmt google_java_executable="java --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED -jar /Users/adonascimento/dev/third_party/google-java-format/google-java-format-1.15.0-all-deps.jar"

let g:terraform_fmt_on_save=1
let g:terraform_align=1

" Use pl for prolog and not perl
let g:filetype_pl="prolog"

"Change the <leader> key to comma instead of \ "
let mapleader=","
nnoremap <silent> <leader> :WhichKey ','<CR>
let maplocalleader="\\"
nnoremap <silent> <localleader> :WhichKey '\\'<CR>

set noswapfile
set nobackup
set nowritebackup
set hidden

" Maintain undo history between sessions
set undofile
set undodir=~/.local/share/nvim/undodir/

filetype plugin indent on
aug adn_standard
  au!
  " Insert space in normal mode
  nnoremap <Space> i<Space><Right><Esc>

  " Quit
  nnoremap <Leader>q :quit<CR>
  nnoremap <Leader>k :bdelete<CR>
  " Only
  nnoremap <Leader>o :only<CR>

  " Move to first character
  nnoremap <C-l> $
  " Move to last character
  nnoremap <C-h> ^

  " Move to first character
  nnoremap <C-j> <C-e>
  " Move to last character
  nnoremap <C-k> <C-y>

  " Close lists
  nnoremap <Leader>c :lclose <bar> cclose <bar> pclose <bar> NERDTreeClose <CR>

  " Paste from 0 register
  nnoremap <Leader>p "0p<CR>
  vnoremap <Leader>p "0p<CR>

  " sudo save
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

  " Tabs
  nnoremap <Leader>tt :$tabnew<CR>
  nnoremap <Leader>tc :tabclose<CR>

  " Replace \n with enter
  nnoremap <Leader>n :'<,'>s/\\n/^M/g

  " Jumps and zz
  nnoremap <C-o> <C-o>zz
  nnoremap <C-i> <C-i>zz
  nnoremap {{ {{zz
  nnoremap }} }}zz
  nnoremap [[ [[zz
  nnoremap ]] ]]zz

aug END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set laststatus=2 " show status bar on single window
set cursorline
set encoding=UTF-8
syntax on
let g:airline_theme='deus'
set background=dark
colorscheme material-theme
" Complement material-theme colors
hi Visual guifg=White guibg=LightBlue gui=none
hi MatchParen gui=bold guibg=none guifg=LightMagenta
highlight Comment cterm=italic gui=italic
set hlsearch " Highlight search matches
highlight Search ctermbg=black ctermfg=cyan term=bold cterm=bold

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CURSOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy to both clipboards at the same time
" set clipboard=unnamed
set timeoutlen=500 ttimeoutlen=0 " for esc delay

" Change cursor on insert Gnome
" let &t_SI = \"\<Esc>[6 q"
" let &t_SR = \"\<Esc>[4 q"
" let &t_EI = \"\<Esc>[2 q"

" Copy to clipboard requires clipboard provider. Try :CheckHealth
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype python,elm,groovy setlocal ts=4 sts=4 sw=4
autocmd FileType cucumber setl ts=2 sw=2 sts=2 et
autocmd FileType markdown setl ts=2 sw=2 sts=2 et tw=79

set backspace=2
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set lbr
" set tw=120
set colorcolumn=80

set number
set noerrorbells
set ruler
set scrolloff=3
set sidescrolloff=5
set confirm
set exrc

" Splits
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Google Java Format
augroup autoformat_settings
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType javascript,typescript,javascript.jsx,typescript.tsx AutoFormatBuffer prettier
augroup END

"Vim markdown list format
autocmd FileType markdown
    \ set formatoptions-=q |
    \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" Typescript/Javascript

"" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx, set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

"" dark red
hi tsxTagName guifg=#E06C75

"" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

"" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" Indent
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 0

" Maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <silent><C-w>z :MaximizerToggle!<CR>
let g:maximizer_set_mapping_with_bang = 1

" Notational
let g:nv_search_paths = ['~/dev/adn/notes']
let g:nv_use_short_pathnames = 1

" Deoplete
"" Disable keyword completition
inoremap <C-p> <Nop>
" nnoremap <Leader>z :call deoplete#toggle()<CR>

"vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

" pgsql
let g:sql_type_default = 'pgsql'

" Git
"" Fugitive
command -nargs=1 Browse silent exe '!xdg-open ' . "<args>"
aug adn_fugitive
  au!
  nmap <Leader>gs :Git<CR>
  nmap <Leader>gd :Gvdiffsplit<CR>
  nmap <Leader>gl :0Gclog<CR>
  nmap <Leader>gb :Git blame<CR>
  nmap <Leader>gr :Gread<CR>
  nmap <Leader>gw :Gwrite<CR>
  nmap <Leader>gc :Git commit<CR>
aug END
let g:github_enterprise_urls = ['https://source.datanerd.us']

"" GitGutter
let g:gitgutter_map_keys = 0
aug adn_gitgutter
  nmap ]c <Plug>(GitGutterNextHunk)
  nmap [c <Plug>(GitGutterPrevHunk)
  nmap <Leader>gg :GitGutterAll<CR>
  nmap <Leader>ga <Plug>(GitGutterStageHunk)
  nmap <Leader>gu <Plug>(GitGutterUndoHunk)
  nmap <Leader>gp <Plug>(GitGutterPreviewHunk)
  nmap <Leader>gm :Gdiff master <bar> let g:gitgutter_diff_base = master<CR>
aug END

set updatetime=100 " reduce the time to make signs appear

"" Search modified git files
nmap <Leader>gf <cmd>lua require('telescope.builtin').git_status()<cr>

" Tagbar
nmap <Leader>tb :SymbolsOutline<CR>

" Gutentags
let g:gutentags_project_root = ['node_modules']
let g:gutentags_cache_dir = "~/.vim/tags/"

"" Needs to have installed and compiled
"" stack install gutenhasktags hasktags ghcid stylish-haskell hlint
let g:gutentags_project_info = [ {'type': 'haskell', 'file': 'Setup.hs'} ]
let g:gutentags_ctags_executable_haskell = 'gutenhasktags'

" NeoMake
" let g:neomake_open_list = 2
" au FileType elixir :call neomake#configure#automake('nrwi', 500)
" let g:neomake_elixir_enabled_makers = ['credo']
" let g:neomake_elixir_credo_args = neomake#makers#ft#elixir#credo().args + ['--strict']
" let g:neomake_python_enabled_makers = ['flake8']

" Airline
let g:airline_powerline_fonts = 1

" Line numbers
let g:airline_section_z = '%3p%% %4l%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# %3v'
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 100,
  \ 'x': 100,
  \ 'y': 150,
  \ 'z': 45,
  \ 'warning': 80,
  \ 'error': 80,
  \ }

let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'z', 'error', 'warning' ]
    \ ]

" NERDTree
nmap <Leader>e :NERDTreeToggle<CR>
noremap <Leader>E :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '__pycache__']
let NERDTreeWinSize=50

" Needed for trees-context floating win border
" https://github.com/neovim/neovim/issues/17996#issuecomment-1186208986
highlight FloatBorder guifg=#021316
" Syntax highlight
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "go", "rust", "kotlin", "typescript"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

require'treesitter-context'.setup { separator = '-' }
EOF
nmap <Leader>lh :write <bar> edit <bar> TSBufEnable highlight<CR>

" lua <<EOF
" require'lspconfig'.jdtls.setup{}
" EOF

" autocmd Filetype java setlocal omnifunc=v:lua.vim.lsp.omnifunc
" nnoremap <leader>dd  <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>do     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>di    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>dh <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>dt   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <leader>dr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <leader>ds    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <leader>dw    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <leader>de   <cmd>lua vim.lsp.buf.declaration()<CR>

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Disable mappings and add Toggle manually
let g:NERDCreateDefaultMappings = 0
map <leader>/ <plug>NERDCommenterToggle

" JSON FORMAT
nmap <Leader>j :%!python3 -m json.tool<CR>

" Vimtex
" `neovim-remote` implements the |--remote| used for feedback
let g:vimtex_latexmk_progname='~/.virtualenvs/neovim-remote/bin/nvr'

" Elm-vim
" let g:elm_format_autosave = 1
" let g:elm_setup_keybindings = 0
" nmap <localleader>et <Plug>(elm-test)
" nmap <localleader>er <Plug>(elm-repl)
" nmap <localleader>ee <Plug>(elm-error-detail)
" nmap <localleader>ed <Plug>(elm-show-docs)
" nmap <localleader>ew <Plug>(elm-browse-docs)

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" search
set ignorecase
" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

aug adn_telescope
  nnoremap <Leader>f <cmd>Telescope find_files<cr>
  nnoremap <Leader>b <cmd>Telescope buffers<cr>
  nnoremap <leader>lw <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
  nnoremap <leader>ls <cmd>Telescope lsp_document_symbols<cr>
  nnoremap <leader>lr <cmd>Telescope lsp_references<cr>
  nnoremap <leader>li <cmd>Telescope lsp_implementations<cr>
  nnoremap <Leader>a <cmd>Telescope grep_string<cr>
  nnoremap <Leader>s <cmd>Telescope live_grep<cr>
  nnoremap <Leader>u <cmd>Telescope current_buffer_fuzzy_find<cr>
  nnoremap <Leader>d <cmd>lua require('dash.providers.telescope').dash({ bang = false, initial_text = '' })<cr>
  nnoremap z= <cmd>Telescope spell_suggest<cr>
aug END

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --color "always" --line-number --no-heading --hidden --follow '. <q-args>, 1, <bang>0)

" make Rg ignore the filename
command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   {'options': '--delimiter : --nth 2..'})

" vim-test
if filereadable("./gradlew")
    let test#java#runner = 'gradletest'
    let test#java#gradletest#executable = './gradlew test --info'
endif

let g:delve_new_command = 'tabnew'
function! DebugNearest()
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction

aug adn_vim_test
  au!
  " these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
  nmap <leader>xn :TestNearest<CR>
  nmap <leader>xf :TestFile<CR>
  nmap <leader>xs :TestSuite<CR>
  nmap <leader>xl :TestLast<CR>
  nmap <leader>xv :TestVisit<CR>
  nmap <leader>xg :call DebugNearest()<CR>
  nmap <leader>xgb :DlvToggleBreakpoint<CR>
  nmap <leader>xgc :DlvClearAll<CR>
aug END

" Python Isort
" let g:vim_isort_python_version = 'python3'

" Alchemist
let g:alchemist#elixir_erlang_src = '/Users/adonascimento/dev/third_party/elixir_erlang_src'
let g:alchemist_tag_disable = 1

" Mix-format
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

"" ghcid
au FileType haskell nnoremap <buffer> <Leader>h :Ghcid<CR>

" Golang
au FileType go nmap <Leader>se :GoDeclsDir<CR>
au FileType go nmap <Leader>si <Plug>(go-info)
au FileType go nmap <Leader>sm <Plug>(go-implements)
au FileType go nmap <leader>st <Plug>(go-test-func)
au FileType go nmap <leader>sy <Plug>(go-test)
au FileType go nmap <leader>sd <Plug>(go-doc)
au FileType go nmap <leader>sp <Plug>(go-channelpeers)
au FileType go nmap <leader>sc <Plug>(go-callers)

aug adn_vimspector
  nmap <leader>ic <Plug>VimspectorContinue
  nmap <leader>is <Plug>VimspectorStop
  nmap <leader>ir <Plug>VimspectorRestart
  nmap <leader>ip <Plug>VimspectorPause
  nmap <leader>ib <Plug>VimspectorToggleBreakpoint
  nmap <leader>iv <Plug>VimspectorToggleConditionalBreakpoint
  nmap <leader>if <Plug>VimspectorAddFunctionBreakpoint
  nmap <leader>io <Plug>VimspectorStepOver
  nmap <leader>ii <Plug>VimspectorStepInto
  nmap <leader>iu <Plug>VimspectorStepOut
  nmap <leader>it <Plug>VimspectorRunToCursor
aug END

aug adn_plugins
  au!
  " Mundo
  nmap <leader>m :MundoToggle<CR>
aug END

let g:vimspector_enable_mappings = 'HUMAN'

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.6)
    let height = float2nr(&lines * 0.6)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:peekaboo_window="call CreateCenteredFloatingWindow()"
