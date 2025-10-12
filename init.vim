" note: brew install ripgrep
call plug#begin('~/.local/share/nvim/plugged')
Plug 'https://github.com/mattn/emmet-vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
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
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/github/copilot.vim'
Plug 'https://github.com/peitalin/vim-jsx-typescript'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/mg979/vim-visual-multi'
call plug#end()



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
" set pastetoggle=<f5>  " Removed in newer Neovim versions

set ignorecase
set smartcase

set backupcopy=yes

" https://zerokspot.com/weblog/2016/07/10/editorconfig-in-neovim/
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

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
set nu

set clipboard=unnamed

set termguicolors
colorscheme gruvbox
set background=dark

" FILETYPE
" vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.scss
" typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" csv
autocmd BufNewFile,BufRead *.csv setlocal noexpandtab
" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
" markdown
autocmd FileType markdown setlocal wrap linebreak
autocmd FileType markdown Copilot disable
autocmd FileType markdown set spell
autocmd FileType markdown set spelllang=en,sr
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType markdown setlocal nonumber
autocmd FileType markdown let b:airline_disable_statusline = 1



" FOLDING
autocmd Syntax javascript,jsx,vue,typescript,pug setlocal foldmethod=syntax

" https://superuser.com/questions/1056929/open-file-in-vertical-split-in-vim-netrw/1062063#1062063
" open file vertically to the right
let g:netrw_altv=1

" save
noremap <leader>s :update<CR>

" COC
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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
"End COC


" FZF
set rtp+=/opt/homebrew/opt/fzf

" vim-fzf shortcuts
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffer<CR>

" Using ripgrep with FZF
command! -nargs=* R call FzfRg(<q-args>)

" Ensure FZF uses ripgrep and ignores node_modules
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*"  --glob "!bundle*"'
endif

" Use rg in fzf.vim and ignore node_modules
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!bundle*" --fixed-strings '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" End FZF

let g:rooter_patterns = ['.git']

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>


" Prettier
augroup PrettierOnSave
  autocmd!
  autocmd BufWritePre *.tsx,*.jsx :Prettier
augroup END

let g:prettier#config#single_quote = 'true'
" End Prettier

" Dim inactive tmux panes
augroup TmuxFocusDim
  autocmd!
  autocmd FocusLost * highlight Normal guibg=#3a3a3a
  autocmd FocusGained * highlight Normal guibg=NONE
augroup END
