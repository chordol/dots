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
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/HerringtonDarkholme/yats.vim'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'https://github.com/digitaltoad/vim-pug.git'
Plug 'tanvirtin/monokai.nvim'
" Plug 'https://github.com/davidhalter/jedi-vim'
call plug#end()


let g:prettier#config#single_quote = 'true'


set foldlevel=20
set cursorline

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

set ignorecase
set smartcase

" https://zerokspot.com/weblog/2016/07/10/editorconfig-in-neovim/
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
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

" FILETYPE
" vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.scss
" typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
" csv
autocmd BufNewFile,BufRead *.csv setlocal noexpandtab

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" FOLDING
autocmd Syntax javascript,vue,typescript,pug setlocal foldmethod=syntax
" autocmd Syntax js,vue normal zR

" https://superuser.com/questions/1056929/open-file-in-vertical-split-in-vim-netrw/1062063#1062063
" open file vertically to the right
let g:netrw_altv=1

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
" save
noremap <leader>s :update<CR>


augroup after_plugin_coc_vim
    au!
    " set term title to current file
    autocmd BufReadPost * if !filereadable("tags") | nmap <buffer> <silent> <C-]> :<C-u>call CocAction('jumpDefinition') <bar> exec('norm! zz')<CR> | endif
    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
    inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
    " use <tab> to trigger completion and navigate to the next complete item
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    inoremap <silent><expr> <Tab>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
augroup END

" Make FZF respect .gitignore
" https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

set rtp+=/usr/local/opt/fzf

let g:python_host_prog = '/Users/sdzeletovic/.pyenv/shims/python'
let g:python3_host_prog = '/Users/sdzeletovic/.pyenv/shims/python3'

function! MyFoldText()
    let nblines = v:foldend - v:foldstart + 1
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let line = getline(v:foldstart)
    let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let expansionString = repeat(".", w - strwidth(nblines.comment.'"'))
    let txt = comment . expansionString . nblines
    return txt
endfunction
set foldtext=MyFoldText()

set backupcopy=yes
