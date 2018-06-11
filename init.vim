call plug#begin('~/.local/share/nvim/plugged')
Plug 'https://github.com/mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-surround.git'
" Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
" Snipmate
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/garbas/vim-snipmate.git'
" End Snipmate
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'editorconfig/editorconfig-vim'
Plug 'https://github.com/airblade/vim-rooter'
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/flazz/vim-colorschemes'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'posva/vim-vue'
" Plug 'leafgarland/typescript-vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
call plug#end()

set wildignorecase " case-insensitive filename completion
set autoread " automatically load changed files
set ttyfast
set hidden
set nobackup
set noswapfile
set nowrap

let mapleader=" "
set pastetoggle=<f5>

set nu
filetype indent on    " Enable filetype-specific indenting

set ignorecase
set smartcase

" https://zerokspot.com/weblog/2016/07/10/editorconfig-in-neovim/
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
" let g:deoplete#enable_at_startup = 1
" let g:EditorConfig_core_mode = 'external_command'

" airline config
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0

"enable mouse
set mouse=a

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set tabstop=4
set shiftwidth=4
set expandtab

set clipboard=unnamed

" strip trailing whitespace on write
" autocmd BufWritePre * %s/\s\+$//e

set termguicolors
colorscheme Monokai

" FOLDING
autocmd Syntax js,vue setlocal foldmethod=syntax
" autocmd Syntax js,vue normal zR

" FILETYPE
" vue
" autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.scss
" typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript


" Neat for Javascript
" Console log from insert mode; Puts focus inside parentheses
" imap cll console.log();<Esc>==f(a
" Console log from visual mode on next line, puts visual selection inside parentheses
" vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
" nmap cll yiwocll<Esc>p

" vim-fzf shortcuts
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffer<CR>

" Make FZF respect .gitignore
" https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

set rtp+=/usr/local/opt/fzf
