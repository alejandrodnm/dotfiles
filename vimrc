set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdcommenter'  " Comment blocks of codes
Plugin 'scrooloose/nerdtree'  " File system explorer
Plugin 'neomake/neomake'  " Linter
Plugin 'majutsushi/tagbar'  " classes and methods list
Plugin 'xolox/vim-misc'  " Scripts required by easytags
Plugin 'tpope/vim-fugitive'  " Git support
Plugin 'crusoexia/vim-monokai'  " Theme
Plugin 'mileszs/ack.vim' " Search folders with ag
Plugin 'tpope/vim-unimpaired'  " Mappings
Plugin 'bling/vim-airline'  " Status line info
Plugin 'godlygeek/tabular'  " Autotabs for puppet
Plugin 'airblade/vim-gitgutter'  " Shows git signs
Plugin 'Shougo/deoplete.nvim'  " Autocomplete
Plugin 'junegunn/fzf.vim'
Plugin 'file:///home/adn/dev/third_party/fzf'
Plugin 'ludovicchabant/vim-gutentags'  " ctags handling

" Languages plugins
" Plugin 'lervag/vimtex'  " Support for latex files and projects
Plugin 'fisadev/vim-isort'  " Python imports
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi'
Plugin 'zchee/deoplete-jedi'
" Plugin 'pbogut/deoplete-elm'
" Plugin 'elmcast/elm-vim'
" Plugin 'jalvesaq/Nvim-R'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'plasticboy/vim-markdown'
" Plugin 'raichoo/purescript-vim'
Plugin 'exu/pgsql.vim'
Plugin 'ethereum/vim-solidity'

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

" Nvim python
let g:python3_host_prog = '/bin/python3'
let g:python_host_prog = '/bin/python2'

"Change the <leader> key to comma instead of \ "
let mapleader=","
let maplocalleader="\\"

" Disable keyword completition
inoremap <C-p> <Nop>
nnoremap <Leader>d :call deoplete#toggle()<CR>

" sudo save
cmap w!! w !sudo tee > /dev/null %

" If left to auto webpack doesn't detect file changes
set backupcopy=yes

set hidden

set undofile " Maintain undo history between sessions
set undodir=~/.local/share/nvim/undodir/

" Insert space in normal mode
nnoremap <Space> i<Space><Right><Esc>

" Go to last edited buffer
nnoremap <bs> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
"set background=dark
colorscheme monokai
" Change bracket highlight color for monokai
hi MatchParen ctermbg=234 ctermfg=141 cterm=bold
hi MatchParen guifg=#ae81ff guibg=#272822 gui=bold
filetype plugin indent on
set laststatus=2 " show status bar on single window
set cursorline
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CURSOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy to both clipboards at the same time
" set clipboard=unnamed
set timeoutlen=1000 ttimeoutlen=0 " for esc delay

"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
" nnoremap D "_D
" vnoremap D "_D
" nnoremap c "_c
" vnoremap c "_c
" nnoremap C "_C
" vnoremap C "_C
" xnoremap p pgvy

" NVIM supports cursors by default with the env
"export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Change cursor on insert Gnome
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Copy to clipboard requires clipboard provider. Try :CheckHealth
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype python,elm setlocal ts=4 sts=4 sw=4
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
set ruler
set hlsearch " Highlight search matches
highlight Search ctermbg=black ctermfg=cyan term=bold cterm=bold

" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Splits
set splitbelow
set splitright

" Tabs
nnoremap <Leader>tt :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Tagbar
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_foldlevel=0
nmap <Leader>b :TagbarToggle<CR>
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

" Gutentags
let g:gutentags_project_root = ['node_modules']

" NeoMake
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

let g:neomake_elixir_enabled_makers = ['mycredo']
function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
        let type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
        let type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
        let type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
        let type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
        let type = 'W'
    else
        let type = 'M'           " Everything else is a message
    endif
    let a:entry.type = type
endfunction
let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline', '--strict'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ 'postprocess': function('NeomakeCredoErrorType')
      \ }

let g:neomake_python_enabled_makers = ['flake8']

let g:neomake_javascript_prettier_maker = {
    \ 'exe': 'prettier-eslint',
    \ 'args': ['--write', '%:p']
    \ }
let g:neomake_javascript_enabled_makers = ['prettier', 'eslint']
let g:neomake_jsx_enabled_makers = ['prettier', 'eslint']
augroup neomake_augroup
  autocmd!
  autocmd BufWritePost * Neomake
  autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))
  function! s:Neomake_callback(options)
    if (a:options.name ==? 'prettier') && (a:options.status == 0)
      edit
    endif
  endfunction
augroup END

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

" IndentLines
let g:indentLine_enabled = 0
nmap <Leader>i :IndentLinesToggle<CR>

" JSON FORMAT
nmap <Leader>j :%!python -m json.tool<CR>

" Vimtex
" `neovim-remote` implements the |--remote| used for feedback
let g:vimtex_latexmk_progname='~/.virtualenvs/neovim-remote/bin/nvr'

" Elm-vim
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0
nmap <localleader>et <Plug>(elm-test)
nmap <localleader>er <Plug>(elm-repl)
nmap <localleader>ee <Plug>(elm-error-detail)
nmap <localleader>ed <Plug>(elm-show-docs)
nmap <localleader>ew <Plug>(elm-browse-docs)

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

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

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --color "always" --line-number --no-heading --hidden --follow '.shellescape(<q-args>), 1, <bang>0)

" Isort
let g:vim_isort_python_version = 'python3'

" Alchemist
let g:alchemist#elixir_erlang_src = '/home/adn/dev/third_party/elixir_erlang_src'

" ipdb
" pip2 install neovim
python << EOF
import vim
import re

ipdb_breakpoint = 'import pdb; pdb.set_trace()'

def set_breakpoint():
    breakpoint_line = int(vim.eval('line(".")')) - 1

    current_line = vim.current.line
    white_spaces = re.search('^(\s*)', current_line).group(1)

    vim.current.buffer.append(white_spaces + ipdb_breakpoint, breakpoint_line)

vim.command('nmap <Leader>pb :py set_breakpoint()<cr>')

def remove_breakpoints():
    op = 'g/^.*%s.*/d' % ipdb_breakpoint
    vim.command(op)

vim.command('nmap <Leader>pc :py remove_breakpoints()<cr>')
EOF

function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
