set nocompatible      " We're running Vim, not Vi!

set hidden
set nobackup
set noswapfile

set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
set nu

" Fix Vim + Tmux yank/paste on unnamed register
" https://stackoverflow.com/questions/11404800/fix-vim-tmux-yank-paste-on-unnamed-register
" if $TMUX == ''
"     set clipboard+=unnamed
" endif
set clipboard=unnamed

let mapleader=" "

set laststatus=2
set foldmethod=syntax
set foldenable
set foldlevel=99

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
" Snipmate
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/garbas/vim-snipmate.git'
" End Snipmate
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/airblade/vim-rooter'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/flazz/vim-colorschemes'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Remove arrows from airline.
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline_theme='base16_solarized'

let g:rooter_patterns = ['.git/']
" http://stackoverflow.com/questions/19297627/set-vim-current-working-directory-to-the-current-project-root-or-to-the-director
autocmd BufWinEnter * :Rooter

" Comment out to allow netrw copy in the same directory
" https://groups.google.com/forum/#!topic/vim_use/6yqU3RX2CWA
" let g:netrw_keepdir=0

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
au BufRead,BufNewFile *.kontext setfiletype html

onoremap <silent> j gj
onoremap <silent> k gk
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

syntax on
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" Neat for Javascript
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p 


" Make FZF respect .gitignore
" https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

set rtp+=/usr/local/opt/fzf
