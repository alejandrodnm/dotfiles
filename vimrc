filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'crusoexia/vim-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'jdkanani/vim-material-theme'

Plugin 'scrooloose/nerdcommenter'  " Comment blocks of codes
Plugin 'scrooloose/nerdtree'  " File system explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'neomake/neomake'  " Linter
Plugin 'majutsushi/tagbar'  " classes and methods list
Plugin 'tpope/vim-fugitive'  " Git support
Plugin 'tpope/vim-endwise'
Plugin 'mileszs/ack.vim' " Search folders with ag
Plugin 'tpope/vim-unimpaired'  " Mappings
Plugin 'vim-airline/vim-airline'  " Status line info
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'  " Shows git signs
Plugin 'junegunn/fzf.vim' " Fuzzy search
Plugin 'junegunn/fzf'
Plugin 'ludovicchabant/vim-gutentags' " ctags handling
Plugin 'ntpeters/vim-better-whitespace' " Showing and removing trailing whitespaces
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plugin 'rizzatti/dash.vim'
Plugin 'https://github.com/alok/notational-fzf-vim' " Note taking
Plugin 'szw/vim-maximizer'

" Languages plugins

" GO
Plugin 'zchee/deoplete-go', { 'do': 'make' }
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
" Plugin 'fisadev/vim-isort'  " Python imports
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'davidhalter/jedi'
" Plugin 'zchee/deoplete-jedi'
" Plugin 'ambv/black', {'rtp': 'vim'}

" Elm
" Plugin 'pbogut/deoplete-elm'
" Plugin 'elmcast/elm-vim'

" JS and related
" Plugin 'mxw/vim-jsx'
" Plugin 'pangloss/vim-javascript'
" Plugin 'hail2u/vim-css3-syntax'
" Plugin 'cakebaker/scss-syntax.vim'

" Elixir
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'mhinz/vim-mix-format'

" Haskell
" Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plugin 'neovimhaskell/haskell-vim'
" Plugin 'nbouscal/vim-stylish-haskell'

" If the binary is not found generate it manually
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }


Plugin 'plasticboy/vim-markdown'
Plugin 'exu/pgsql.vim'

Plugin 'godlygeek/tabular'  " Autotabs for puppet
Plugin 'rodjek/vim-puppet'
" Plugin 'raichoo/purescript-vim'
" Plugin 'jalvesaq/Nvim-R'
" Plugin 'lervag/vimtex'  " Support for latex files and projects

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Use pl for prolog and not perl
let g:filetype_pl="prolog"

"Change the <leader> key to comma instead of \ "
let mapleader=","
let maplocalleader="\\"

" sudo save
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" If left to auto webpack doesn't detect file changes
" set backupcopy=yes

" Allow undisplayed buffers with unsaved changes
set hidden

" Maintain undo history between sessions
set undofile
set undodir=~/.local/share/nvim/undodir/

" Insert space in normal mode
nnoremap <Space> i<Space><Right><Esc>

" Quit
nnoremap <Leader>q :quit<CR>
" Only
nnoremap <Leader>o :only<CR>

" Move to first character
nnoremap <C-l> $
" Move to last character
nnoremap <C-h> ^

" Close location list
nnoremap <Leader>cl :lclose<CR>
" Close quickfix window
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>cp :pclose<CR>

" Paste from 0 register
nnoremap <Leader>p "0p<CR>
vnoremap <Leader>p "0p<CR>

" Search
cnoreabbrev Ack Ack!
"" word under cursor
nnoremap <Leader>a :Ack!<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" Seach in Dash
nnoremap <Leader>d :Dash<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='deus'
set termguicolors
syntax on
set background=dark
colorscheme material-theme
set laststatus=2 " show status bar on single window
set cursorline
set encoding=UTF-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CURSOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy to both clipboards at the same time
" set clipboard=unnamed
set timeoutlen=1000 ttimeoutlen=0 " for esc delay

" Change cursor on insert Gnome
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Copy to clipboard requires clipboard provider. Try :CheckHealth
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
autocmd Filetype python,elm,groovy,haskell setlocal ts=4 sts=4 sw=4
autocmd FileType cucumber setl ts=2 sw=2 sts=2 et

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

set hlsearch " Highlight search matches
highlight Search ctermbg=black ctermfg=cyan term=bold cterm=bold

" Splits
set splitbelow
set splitright

" Tabs
nnoremap <Leader>tt :$tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <silent><C-w>z :MaximizerToggle!<CR>
let g:maximizer_set_mapping_with_bang = 1

" Notational
let g:nv_search_paths = ['/Users/adonascimento/dev/adn/notes']
let g:nv_use_short_pathnames = 1

" Deoplete
"" Disable keyword completition
inoremap <C-p> <Nop>
nnoremap <Leader>z :call deoplete#toggle()<CR>

"vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1

" pgsql
let g:sql_type_default = 'pgsql'

" Fugitive
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gc :Gcommit<CR>

" GitGutter
let g:gitgutter_map_keys = 0
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>gg :GitGutterAll<CR>
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk

"" reduce the time to make signs appear
set updatetime=100

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
let g:neomake_open_list = 2

au FileType elixir :call neomake#configure#automake('nrwi', 500)

let g:neomake_elixir_enabled_makers = ['credo']

let g:neomake_elixir_credo_args = neomake#makers#ft#elixir#credo().args + ['--strict']

let g:neomake_python_enabled_makers = ['flake8']

" Airline
let g:airline_powerline_fonts = 1
" disable tagbar extension
let g:airline#extensions#tagbar#enabled = 0
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
    \ [ 'x', 'y', 'z', 'error', 'warning' ]
    \ ]

" NERDTree
nmap <Leader>e :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '__pycache__']
noremap <Leader>E :Explore<CR>

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Disable mappings and add Toggle manually
let g:NERDCreateDefaultMappings = 0
map <leader>v<space> <plug>NERDCommenterToggle

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

" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" fzf
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

" Isort
let g:vim_isort_python_version = 'python3'

" Alchemist
let g:alchemist#elixir_erlang_src = '/Users/adonascimento/dev/third_party/elixir_erlang_src'
let g:alchemist_tag_disable = 1

" Mix-format
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

" Haskell

autocmd! BufWritePre *.hs :call LanguageClient#textDocument_formatting_sync()

"" ghcid
au FileType haskell nnoremap <buffer> <Leader>h :Ghcid<CR>

"" hie
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
nnoremap <Leader>lc :call LanguageClient_contextMenu()<CR>
au FileType haskell map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
au FileType haskell map <Leader>ld :call LanguageClient#textDocument_definition()<CR>
au FileType haskell map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
au FileType haskell map <Leader>lr :call LanguageClient#textDocument_references()<CR>
au FileType haskell map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
au FileType haskell map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

"Go
let g:go_fmt_command = "goimports"

au FileType go nmap <Leader>se :GoDeclsDir<CR>
au FileType go nmap <Leader>si <Plug>(go-info)
au FileType go nmap <Leader>sm <Plug>(go-implements)
au FileType go nmap <leader>st <Plug>(go-test-func)
au FileType go nmap <leader>sy <Plug>(go-test)
au FileType go nmap <leader>sd <Plug>(go-doc)
au FileType go nmap <leader>sp <Plug>(go-channelpeers)
au FileType go nmap <leader>sc <Plug>(go-callers)
au FileType go nmap <leader>xb <Plug>(go-debug-breakpoint)
au FileType go nmap <leader>xn <Plug>(go-debug-next)
au FileType go nmap <leader>xs <Plug>(go-debug-step)
au FileType go nmap <leader>xc <Plug>(go-debug-continue)
au FileType go nmap <leader>xo <Plug>(go-debug-stepout)
au FileType go nmap <leader>xp <Plug>(go-debug-print)

" ipdb
" python << EOF
" import vim
" import re

" ipdb_breakpoint = 'import pdb; pdb.set_trace()'

" def set_breakpoint():
"     breakpoint_line = int(vim.eval('line(".")')) - 1

"     current_line = vim.current.line
"     white_spaces = re.search('^(\s*)', current_line).group(1)

"     vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)

" vim.command('nmap <Leader>pb :py set_breakpoint()<cr>')

" def remove_breakpoints():
"     op = 'g/^.*%s.*/d' % ipdb_breakpoint
"     vim.command(op)

" vim.command('nmap <Leader>pc :py remove_breakpoints()<cr>')
" EOF

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
