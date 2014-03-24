execute pathogen#infect()
set nocompatible
set backspace=indent,eol,start
syntax on

colorscheme grb256

set cursorline
set cursorcolumn
set colorcolumn=80
hi CursorLine term=bold cterm=bold ctermbg=234
hi CursorColumn ctermbg=233
hi ColorColumn ctermbg=233


filetype on
filetype plugin on
filetype plugin indent on

set rnu
set hidden
set incsearch
set hlsearch

" indent stuff
set list
set ts=4 expandtab
set shiftwidth=4
set softtabstop=4

set pastetoggle=<F2>

" Beeping/Flashing
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set laststatus=2

set wildchar=<Tab> wildmenu wildmode=full

" Maps
nmap <C-l> :bn<CR>
nmap <C-h> :bp<CR>
nmap <C-@> :ls<CR>
nmap K i<CR><ESC>k$

nnoremap <up> <ESC>
nnoremap <down> <ESC>
nnoremap <left> <ESC>
nnoremap <right> <ESC>

inoremap <up> <ESC>
inoremap <down> <ESC>
inoremap <left> <ESC>
inoremap <right> <ESC>

vnoremap <up> <ESC>
vnoremap <down> <ESC>
vnoremap <left> <ESC>
vnoremap <right> <ESC>

" Leader Stuff

map <leader>\ :noh<CR>
