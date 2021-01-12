" Don’t add empty newlines at the end of files
" set binary
" set noeol

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

set guicursor=

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

"Hghlight seaches
set hlsearch

" Ignore case of searches
set ignorecase

set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

" Automatically indent lines
set smartindent

" Always show status line
set laststatus=2

set nu
set nowrap
" set noswapfile
" set nobackup

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
	set undofile
endif

" Case sensitive searching
" set smartcase

" Enable mouse in all modes
set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set showmode
set signcolumn=yes

" Show the filename in the window titlebar
set title

" Respect modeline in files
set modeline
set modelines=4

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don’t show the intro message when starting Vim
set shortmess+=atI

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80


" Detect filetypes
filetype plugin indent on

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
if !has('nvim')
	set esckeys
endif

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Strip trailing whitespace (<leader> ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
