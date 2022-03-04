" General
set encoding=utf-8
set nobackup
set history=20
set hidden
set clipboard=unnamed
set nowritebackup
set autoread
set cryptmethod="blowfish2"
set noswapfile
set viminfo=""
set synmaxcol=100000
syntax sync minlines=100000

" UI
set splitbelow
set splitright
set scrolloff=4
set laststatus=2
set noruler
set noshowcmd
set noshowmode
set nomodeline
set number
set cursorline
set splitbelow
set splitright
set ttyscroll=3
set completeopt=menuone,preview,noinsert
set pumheight=10
set fillchars=vert:┃,stl:\ ,stlnc:\ 

" Search
set ignorecase
set smartcase
set incsearch  " realtime search results
set hlsearch

" Editing
set backspace=indent,eol,start
set showmatch
set matchtime=2  " Show match for 0.2 secs
set formatoptions=cqrnj1
set autoindent
set timeout
set ttimeout
set ttimeoutlen=1
set timeoutlen=600
set nomodeline

" Line wrapping and display
set linebreak  " default `breakat` is pretty ok
set textwidth=80
set formatoptions+=qrnj1  " The flexible way to write/edit comments

" Tabs & Spaces
set expandtab
set smarttab
set shiftwidth=4
set tabstop=8
set softtabstop=4

" Wildmenu
set wildmenu
set wildmode=full
