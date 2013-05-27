set nu
syntax on

filetype plugin indent on

" indent stuff
set ts=4 expandtab
set shiftwidth=4
set softtabstop=4

set pastetoggle=<F2>

" tab remap
nmap <C-t> :tabnew<CR>
nmap <C-l> :tabnext<CR>
nmap <C-h> :tabprevious<CR>

" disable arrows
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

" Beeping/Flashing
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

