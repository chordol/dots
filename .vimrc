set nocompatible      " We're running Vim, not Vi!

set directory=~/.swptemp
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/tpope/vim-fugitive'
" Making things slow
Plug 'https://github.com/pangloss/vim-javascript'
" Plug 'https://github.com/jelera/vim-javascript-syntax'
Plug 'https://github.com/mxw/vim-jsx'
" Snipmate
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/garbas/vim-snipmate.git'
" End Snipmate
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/airblade/vim-rooter'
" Plug 'https://github.com/tpope/vim-markdown'
" Plug 'https://github.com/nelstrom/vim-markdown-folding'
Plug 'https://github.com/godlygeek/tabular'
" Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/flazz/vim-colorschemes'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
" Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
" Plug 'Valloric/YouCompleteMe'
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
call plug#end()

" Syntastic default settings
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['jshint']

" https://github.com/nelstrom/vim-markdown-folding
if has("autocmd")
  filetype plugin indent on
endif

" set re=1

set hidden
set nobackup
set noswapfile

" Remove arrows from airline. They are mis
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:rooter_patterns = ['.git/']
" http://stackoverflow.com/questions/19297627/set-vim-current-working-directory-to-the-current-project-root-or-to-the-director
autocmd BufWinEnter * :Rooter

" set directory=~/.vim/swap_files//

set mouse=a
set ttymouse=xterm2
set nu
set clipboard=unnamed

" Allow netrw copy in the same directory
" https://groups.google.com/forum/#!topic/vim_use/6yqU3RX2CWA
" let g:netrw_keepdir=0

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufRead,BufNewFile *.kontext setfiletype html

let mapleader=" "
set laststatus=2
set foldenable
set foldlevel=99

" vim-fzf shortcuts
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffer<CR>

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set pastetoggle=<f5>

set backspace=indent,eol,start
set hlsearch
set incsearch
set nowrap

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set scrolloff=5
set ignorecase
set infercase

set foldmethod=syntax

set t_Co=256
syntax on
let g:solarized_termtrans = 1                                                   
let g:solarized_termcolors=256                                                  
set background=dark
colorscheme molokai

" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p 

onoremap <silent> j gj
onoremap <silent> k gk


" Make FZF respect .gitignore
" https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

set rtp+=/usr/local/opt/fzf
