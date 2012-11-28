set nu
syntax on

call pathogen#infect()
filetype plugin indent on

" indent stuff
set smartindent 
set ts=4 expandtab
set shiftwidth=4
set softtabstop=4

" solarize stuff
set t_Co=16

" tab remap
nmap <C-t> :tabnew<CR>
nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprevious<CR>

