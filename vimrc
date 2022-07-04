if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Themes
Plug 'crusoexia/vim-monokai'
Plug 'jdkanani/vim-material-theme'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Experimental syntax

Plug 'liuchengxu/vim-which-key' " leader key suggestions
Plug 'junegunn/vim-peekaboo'
Plug 'vim-test/vim-test'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'  " Comment blocks of codes
Plug 'scrooloose/nerdtree'  " File system explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'  " classes and methods list
Plug 'tpope/vim-fugitive'  " Git support
Plug 'tpope/vim-rhubarb' "GBrowse support
Plug 'tpope/vim-endwise'
Plug 'mileszs/ack.vim' " Search folders with ag
Plug 'tpope/vim-unimpaired'  " Mappings
Plug 'vim-airline/vim-airline'  " Status line info
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'  " Shows git signs
Plug 'junegunn/fzf.vim' " Fuzzy search
Plug 'junegunn/fzf'
Plug 'ludovicchabant/vim-gutentags' " ctags handling
Plug 'ntpeters/vim-better-whitespace' " Showing and removing trailing whitespaces
Plug 'https://github.com/alok/notational-fzf-vim' " Note taking
Plug 'szw/vim-maximizer'
Plug 'Yggdroot/indentLine'
Plug 'jamessan/vim-gnupg'

" (The latter must be installed before it can be used.)
" Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" `:help :Glaive` for usage.
" Plug 'google/vim-glaive'

" LSP
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
" Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {
      \'branch': 'release'
      \}
" Plug 'honza/vim-snippets'
Plug 'simnalamburt/vim-mundo' " undo visualization

" Debugger
" Plug 'mfussenegger/nvim-dap' " debugger
" Plug 'theHamsta/nvim-dap-virtual-text'
" Plug 'puremourning/vimspector'

" Kotlin
" Plug 'udalov/kotlin-vim'

" GO
" Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'fatih/vim-go'
Plug 'sebdah/vim-delve'

" Python
" Plug 'fisadev/vim-isort'  " Python imports
" Plug 'vim-scripts/indentpython.vim'
" Plug 'davidhalter/jedi'
" Plug 'zchee/deoplete-jedi'
" Plug 'ambv/black', {'rtp': 'vim'}

" Elm
" Plug 'pbogut/deoplete-elm'
" Plug 'elmcast/elm-vim'

" JS and related
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'jparise/vim-graphql'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'

" ReasonML
" Plug 'reasonml-editor/vim-reason-plus'

" Elixir
" Plug 'elixir-editors/vim-elixir'
" Get the latest elixir-ls release from
" https://github.com/elixir-lsp/elixir-ls/releases and unzip it into
" ~/.vim/plugged/coc-elixir/els-release (unzip elixir-ls.zip -d
" ~/.vim/plugged/coc-elixir/els-release).
" Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

Plug 'mhinz/vim-mix-format'
" Haskell
" Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" Plug 'neovimhaskell/haskell-vim'

Plug 'plasticboy/vim-markdown'
Plug 'exu/pgsql.vim'

Plug 'rust-lang/rust.vim'

Plug 'godlygeek/tabular'  " Autotabs for puppet and markdown table format

" Plug 'hashivim/vim-terraform'
" Plug 'rodjek/vim-puppet'
" Plug 'raichoo/purescript-vim'
" Plug 'jalvesaq/Nvim-R'
" Plug 'lervag/vimtex'  " Support for latex files and projects

call plug#end()

let g:node_host_prog=expand("~/.asdf/installs/nodejs/18.4.0/.npm/bin/neovim-node-host")

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
nmap <Leader>gf :GFiles?<CR>

" Tagbar
let g:tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_foldlevel=0
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

let g:tagbar_type_haskell = {
  \ 'ctagsbin'    : 'hasktags',
  \ 'ctagsargs'   : '-x -c -o-',
  \ 'kinds'       : [
      \  'm:modules:0:1',
      \  'd:data:0:1',
      \  'd_gadt:data gadt:0:1',
      \  'nt:newtype:0:1',
      \  'c:classes:0:1',
      \  'i:instances:0:1',
      \  'cons:constructors:0:1',
      \  'c_gadt:constructor gadt:0:1',
      \  'c_a:constructor accessors:1:1',
      \  't:type names:0:1',
      \  'pt:pattern types:0:1',
      \  'pi:pattern implementations:0:1',
      \  'ft:function types:0:1',
      \  'fi:function implementations:0:1',
      \  'o:others:0:1'
  \ ],
  \ 'sro'          : '.',
  \ 'kind2scope'   : {
      \ 'm'        : 'module',
      \ 'd'        : 'data',
      \ 'd_gadt'   : 'd_gadt',
      \ 'c_gadt'   : 'c_gadt',
      \ 'nt'       : 'newtype',
      \ 'cons'     : 'cons',
      \ 'c_a'      : 'accessor',
      \ 'c'        : 'class',
      \ 'i'        : 'instance'
  \ },
  \ 'scope2kind'   : {
      \ 'module'   : 'm',
      \ 'data'     : 'd',
      \ 'newtype'  : 'nt',
      \ 'cons'     : 'c_a',
      \ 'd_gadt'   : 'c_gadt',
      \ 'class'    : 'ft',
      \ 'instance' : 'ft'
  \ }
\ }

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

" Syntax highlight
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "go", "rust", "kotlin", "typescript"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
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
nmap <Leader>j :%!python -m json.tool<CR>

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

aug adn_fzf
  " Search
  cnoreabbrev Ack Ack!
  "" word under cursor
  nnoremap <Leader>a :Ack!<CR>
  nnoremap <Leader>s :Rg<CR>
  nnoremap <Leader>f :Files<CR>
  nnoremap <Leader>b :Buffers<CR>
  "" set :/ into :Ack!
  cnoreabbrev <expr> / ((getcmdtype() is# ':' && getcmdline() is# '/')?('Ack!'):('/'))
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

" coc-nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" This has issues with endwise mapping of CR see https://github.com/tpope/vim-endwise/issues/109
let g:endwise_no_mappings = v:true
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <Plug>CustomCocCR pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <CR> <Plug>CustomCocCR<Plug>DiscretionaryEnd
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call  CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Format :call CocAction('format')

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" vim-test
if filereadable("./gradlew")
    let test#java#runner = 'gradletest'
    let test#java#gradletest#executable = './gradlew test --info'
endif

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

" Remap key
aug adn_coc
  au!
  let g:coc_start_at_startup = 1
  " autocmd VimEnter * CocStart
  nmap <silent>[d <Plug>(coc-diagnostic-prev)
  nmap <silent>]d <Plug>(coc-diagnostic-next)
  nmap <C-]> <Plug>(coc-definition)
  nmap <leader>lt <Plug>(coc-type-definition)
  nmap <leader>li <Plug>(coc-implementation)
  nmap <leader>lr <Plug>(coc-references-used)
  nmap <leader>ln <Plug>(coc-rename)
  nmap <leader>la  <Plug>(coc-codeaction-line)
  xmap <leader>la  <Plug>(coc-codeaction-selected)
  nmap <leader>le <Plug>(coc-codelens-action)
  " Fix autofix problem of current line
  nmap <leader>lf  <Plug>(coc-fix-current)

  " Use K to show documentation in preview window
  nnoremap <silent>K :call <SID>show_documentation()<CR>

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Using CocList
  " Show snippets
  nnoremap <silent> <leader>lls :<C-u>CocList snippets<cr>
  " Show all diagnostics
  nnoremap <silent> <leader>lld :<C-u>CocList diagnostics<cr>
  " Show commands
  nnoremap <silent> <leader>llc :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <leader>ly :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <leader>lw :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <leader>lln :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <leader>llp :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <leader>lll :<C-u>CocListResume<CR>

  xmap <leader>lp  <Plug>(coc-format-selected)
  nmap <leader>lp <Plug>(coc-format)

  " Use <C-l> for trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)
  " Use <C-j> for select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)
  " Use <C-j> for jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'
  " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'
  " Use <C-j> for both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)
aug END

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Isort
let g:vim_isort_python_version = 'python3'

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
  nmap <leader>ij :CocCommand java.debug.vimspector.start<CR>
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
