set nu
syntax on

call pathogen#infect()
filetype plugin indent on

" indent stuff
set smartindent 
set ts=4 expandtab
set shiftwidth=4
set softtabstop=4

set pastetoggle=<F2>

" tab remap
nmap <C-t> :tabnew<CR>
nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprevious<CR>

" Beeping/Flashing
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
