execute pathogen#infect()
set nocompatible
set backspace=indent,eol,start
syntax on

set background=dark
colorscheme monokai

set cursorline
set cursorcolumn
set colorcolumn=80

filetype plugin indent on

set rnu
set hidden
set incsearch
set hlsearch
set list
set listchars=eol:↓,trail:·
set foldmethod=indent

" indent stuff
set ts=4 expandtab
set shiftwidth=4
set softtabstop=4

set pastetoggle=<F2>

set splitright
set splitbelow

set nobackup
set noswapfile

" Beeping/Flashing
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set laststatus=2
set statusline=%<\ %f\ %m%y%w%=\ L:\ \%l\/\%L\ C:\ \%c\ 

set wildchar=<Tab> wildmenu wildmode=full

" Maps
nmap <C-l> :bn<CR>
nmap <C-h> :bp<CR>
nmap <C-@> :ls<CR>

map <silent> <leader>\ :noh<CR>

nnoremap <silent> <TAB> :keepp /<[^/]<CR>
nnoremap <silent> <S-TAB> :keepp ?<[^/]<CR>
nnoremap <silent> <Space> za
vnoremap <silent> <Space> za
