" Section: Plugin settings {{{1
"--------------------------------------------------------------------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-vinegar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'wting/rust.vim'
Plugin 'lervag/vimtex'
Plugin 'rhysd/clever-f.vim'
Plugin 'johnsyweb/vim-makeshift'
Plugin 'qpkorr/vim-bufkill'
Plugin 'LucHermitte/lh-vim-lib' "dependency of local_vimrc
Plugin 'LucHermitte/local_vimrc'
Plugin 'xolox/vim-misc' "dependency of easytags
Plugin 'xolox/vim-easytags'
Plugin 'bkad/CamelCaseMotion'

call vundle#end()
filetype plugin indent on

" Airline
if &encoding == 'utf-8'
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_powerline_fonts=1
endif

" GitGutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" supertab
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"let g:SuperTabLongestEnhanced=1
"let g:SuperTabLongestHighlight=1

" ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" vim-markdown
let g:vim_markdown_math=1

" vimtex
let g:tex_flavor = "latex"
let g:latex_latexmk_output = 'pdf'
let g:vimtex_complete_close_braces = 1
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = ''
" easytags
let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
                            " Interesting events: WinEnter, TabEnter,
                            " InsertLeave, SessionLoadPost

" Section: Look {{{1
"-------------------------------------------------------------------------

syntax enable
set background=light
silent! colorscheme solarized

" Section: Vim options {{{1
"--------------------------------------------------------------------------

set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me when a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
                            " Allow backspace beyond insertion point
set cindent                 " Automatic program indenting
set cinkeys-=0#             " Comments don't fiddle with indenting
set cino=(0                 " Indent newlines after opening parenthesis
set clipboard=unnamed,unnamedplus
                            " Use system clipboard as default
set commentstring=\ \ #%s   " When folds are created, add them to this
set complete-=i             " Scanning for includes can be painfully slow
set completeopt=menuone,menu,longest,preview
set copyindent              " Make autoindent use the same chars as prev line
set cpoptions+=d
set directory-=.            " Don't store temp files in cwd
set encoding=utf8           " UTF-8 by default
set expandtab               " No tabs
set fileformats=unix,dos,mac
                            " Prefer Unix
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:\ ,diff:┄
                            " Unicode chars for diffs, and rely on
                            " Colors for window borders
silent! set foldmethod=marker
                            " Use braces by default
set formatoptions=jtcqn1    " t - autowrap normal text
                            " j - delete comment character when joining commented lines
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
                            " 2 - use indenting from 2nd line of para
set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Highlight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
set list
if &encoding == 'utf-8'
    set listchars=tab:▶\ ,trail:⋅,extends:❯,precedes:❮,nbsp:·
else
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set matchtime=2             " Tenths of second to hilight matching paren
set modelines=5             " How many lines of head & tail to look for ml's
silent! set mouse=nvc       " Use the mouse, but not in insert mode
set nobackup                " No backups left after done editing
set number                  " Line numbers for hybrid mode
set relativenumber          " Relative numbers for hybrid mode
set nowritebackup           " No backups made while editing
set nrformats-=octal
set visualbell t_vb=        " No flashing or beeping at all
set printoptions=paper:A4   " DIN paper
set ruler                   " Show row/col and percentage
set scroll=4                " Number of lines to scroll with ^U/^D
set scrolloff=15            " Keep cursor away from this many chars top/bot
set shiftround              " Shift to certain columns, not just n spaces
set shiftwidth=4            " Number of spaces to shift for autoindent or >,<
set shortmess+=A            " Don't bother me when a swapfile exists
set showbreak=              " Show for lines that have been wrapped, like Emacs
set showmatch               " Hilight matching braces/parens/etc.
set sidescrolloff=3         " Keep cursor away from this many chars left/right
set smartcase               " Lets you search for ALL CAPS
set softtabstop=4           " Spaces 'feel' like tabs
set suffixes+=.pyc          " Ignore these files when tab-completing

set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/qt
set tags+=~/.vim/tags/qt4

set tabstop=4               " The One True Tab
set notitle                 " Don't set the title of the Vim window
set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full
                            " List all options and complete
set wildignore=*.class,*.o,*.d,*~,*.pyc,.git,node_modules
                            " Ignore certain files in tab-completion
" Section: Key mappings {{{1
"--------------------------------------------------------------------------

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Open, save and close
nnoremap <Leader>o :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <Leader>w :w<CR>
noremap <Leader>W :w !sudo tee % > /dev/null
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

" use j and k in wrapped lines
nnoremap j gj
nnoremap k gk
" split moving for the lazy with ctrl hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" split resizing with alt hjkl
" http://stackoverflow.com/questions/16599867/vim-can-i-have-the-last-key-of-a-multi-key-binding-repeat-the-command
if has('unix')
    nnoremap j 5<C-w>-
    nnoremap k 5<C-w>+
    nnoremap h 5<C-w><
    nnoremap l 5<C-w>>
else
    nnoremap <M-j> 5<C-w>-
    nnoremap <M-k> 5<C-w>+
    nnoremap <M-h> 5<C-w><
    nnoremap <M-l> 5<C-w>>
endif

