" Section: Plugin settings {{{1
"--------------------------------------------------------------------------

" Activate built-in man.vim plugin
runtime! ftplugin/man.vim

" ALE
let g:ale_completion_enabled = 1

call plug#begin()
" Check if fzf is already installed via homebrew
if filereadable('/usr/local/opt/fzf/install')
        Plug '/usr/local/opt/fzf'
else
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'bkad/CamelCaseMotion'
Plug 'mkitt/tabline.vim'
Plug 'tpope/vim-abolish'
Plug 'editorconfig/editorconfig-vim'
" tool binding
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
" look
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
" completion
Plug 'dense-analysis/ale'
" linting
" syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-scripts/MatlabFilesEdition'
Plug 'daeyun/vim-matlab'
Plug 'jwalton512/vim-blade'
Plug 'lumiliet/vim-twig'
Plug 'artoj/qmake-syntax-vim'
Plug 'chr4/nginx.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'alisdair/vim-armasm'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'kergoth/vim-bitbake'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" man.vim
let g:ft_man_open_mode = 'vert'
autocmd FileType man setlocal nolist
set keywordprg=:Man

" Airline
if &encoding == 'utf-8'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts=1
endif

" vim-markdown
let g:vim_markdown_math=1

" easytags
let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
                            " Interesting events: WinEnter, TabEnter,
                            " InsertLeave, SessionLoadPost

" CamelCaseMotion
let g:camelcasemotion_key = ','

" vim-bufkill
let g:BufKillCreateMappings = 0

" ale
let g:ale_rust_cargo_check_all_targets = 1

" sh.vim
" Enable folding for functions (1), heredoc (2) and if/do/for (4)
let g:sh_fold_enabled = 7

" Section: Look {{{1
"-------------------------------------------------------------------------

syntax enable
set background=light
silent! colorscheme solarized
" Make matching parenthesis and cursor distinguishable
hi MatchParen ctermbg=7

" Section: Vim options {{{1
"--------------------------------------------------------------------------

set autoindent                  " Carry over indenting from previous line
set autoread                    " Don't bother me when a file changes
set autowrite                   " Write on :next/:prev/^Z
set backspace=indent,eol,start
                                " Allow backspace beyond insertion point
set cinkeys-=0#                 " Comments don't fiddle with indenting
set cino=(0                     " Indent newlines after opening parenthesis
set clipboard=unnamed,unnamedplus
                                " Use system clipboard as default
set colorcolumn=80              " highlight column 80
set commentstring=\ \ #%s       " When folds are created, add them to this
set complete-=i                 " Scanning for includes can be painfully slow
set completeopt=menuone,menu,longest,preview
set copyindent                  " Make autoindent use the same chars as prev line
set cpoptions+=d
set directory-=.                " Don't store temp files in cwd
set diffopt+=algorithm:patience,indent-heuristic
                                " Set modern diff algorithm
set encoding=utf8               " UTF-8 by default
set expandtab                   " No tabs
set fileformats=unix,dos,mac
                                " Prefer Unix
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:\ ,diff:┄
                                " Unicode chars for diffs, and rely on
                                " Colors for window borders
set foldmethod=syntax           " Folds defined by syntax highlighting
set nofoldenable                " Disable folds by default
set formatoptions=jtcqn1        " t - autowrap normal text
                                " j - delete comment character when joining commented lines
                                " c - autowrap comments
                                " q - gq formats comments
                                " n - autowrap lists
                                " 1 - break _before_ single-letter words
                                " 2 - use indenting from 2nd line of para
set hidden                      " Don't prompt to save hidden windows until exit
set history=200                 " How many lines of history to save
set hlsearch                    " Highlight searching
set ignorecase                  " Case insensitive
set incsearch                   " Search as you type
set laststatus=2                " Always show the status bar
set linebreak                   " Break long lines by word, not char
set list
if &encoding == 'utf-8'
    set listchars=tab:▶\ ,trail:⋅,extends:❯,precedes:❮,nbsp:·
else
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set matchtime=2                 " Tenths of second to hilight matching paren
set modelines=5                 " How many lines of head & tail to look for ml's
silent! set mouse=nvc           " Use the mouse, but not in insert mode
set nobackup                    " No backups left after done editing
set number                      " Line numbers for hybrid mode
set relativenumber              " Relative numbers for hybrid mode
set nowritebackup               " No backups made while editing
set nrformats-=octal            " nobody cares about octal
set visualbell t_vb=            " No flashing or beeping at all
set printoptions=paper:A4       " DIN paper
set ruler                       " Show row/col and percentage
set scroll=4                    " Number of lines to scroll with ^U/^D
set scrolloff=15                " Keep cursor away from this many chars top/bot
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
                                " Sessions don't contain options
set shiftround                  " Shift to certain columns, not just n spaces
set shiftwidth=4                " Number of spaces to shift for autoindent or >,<
set shortmess+=A                " Don't bother me when a swapfile exists
set showbreak=                  " Show for lines that have been wrapped, like Emacs
set showmatch                   " Hilight matching braces/parens/etc.
set sidescrolloff=3             " Keep cursor away from this many chars left/right
set smartcase                   " Lets you search for ALL CAPS
set softtabstop=4               " Spaces 'feel' like tabs
set suffixes+=.pyc              " Ignore these files when tab-completing

set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/qt
set tags+=~/.vim/tags/qt4

set tabstop=4
set notitle                     " Don't set the title of the Vim window
set wildmenu                    " Show possible completions on command line
set wildmode=list:longest,full
                                " List all options and complete
set wildignore=*.class,*.o,*.d,*~,*.pyc,.git,node_modules
                                " Ignore certain files in tab-completion
" Section: Key mappings {{{1
"--------------------------------------------------------------------------

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Open, save and close
nnoremap <Leader>o :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>. :Tags<CR>
nnoremap <Leader>w :w<CR>
noremap <Leader>W :w !sudo tee % > /dev/null
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>fc :BD<CR>
nnoremap <Leader>wc :wincmd c<CR>
nnoremap <Leader>l :lcd %:p:h<CR>
nnoremap <Leader>q :q<CR>
" Better comand-line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap <Leader>m :make<CR>
nnoremap <Leader>mj :make -j12<CR>
nnoremap <Leader>mc :make clean<CR>
nnoremap <Leader>mr :make run<CR>

" Jump to end of line when yanking or pasting
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Make Y behave like other capitals
nnoremap Y y$
" This fixes the annoying window when accidentally hitting q:
map q: :q
" Search and replace tricks
nnoremap <silent> <Leader>u :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
noremap <silent><Leader>/ :nohl<CR>

" use j and k in wrapped lines, don't use with counts
function! LineMotion(dir)
    execute "normal! " . (v:count1 > 1 ? "m'" . v:count1 : "g") . a:dir
endfunction
nnoremap <silent> j :<c-u>call LineMotion("j")<cr>
nnoremap <silent> k :<c-u>call LineMotion("k")<cr>
" split resizing with alt hjkl
" http://stackoverflow.com/questions/16599867/vim-can-i-have-the-last-key-of-a-multi-key-binding-repeat-the-command
"if has('unix')
    "nnoremap j 5<C-w>-
    "nnoremap k 5<C-w>+
    "nnoremap h 5<C-w><
    "nnoremap l 5<C-w>>
"else
    "nnoremap <M-j> 5<C-w>-
    "nnoremap <M-k> 5<C-w>+
    "nnoremap <M-h> 5<C-w><
    "nnoremap <M-l> 5<C-w>>
"endif

" make easy naviagtion work in terminal mode, too
tnoremap <silent> <C-h> <C-W>:TmuxNavigateLeft<cr>
tnoremap <silent> <C-j> <C-W>:TmuxNavigateDown<cr>
tnoremap <silent> <C-k> <C-W>:TmuxNavigateUp<cr>
tnoremap <silent> <C-l> <C-W>:TmuxNavigateRight<cr>

" Section: Autocommands{{{1
"--------------------------------------------------------------------------

" disable line numbers in terminal buffers
au TerminalWinOpen * setlocal nonumber norelativenumber

" 8 spaces
autocmd FileType c setlocal shiftwidth=8 tabstop=8 softtabstop=8 expandtab
autocmd FileType cpp setlocal shiftwidth=8 tabstop=8 softtabstop=8 expandtab
" 2 spaces
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType sass setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

