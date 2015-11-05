execute pathogen#infect()
set nocompatible
set backspace=indent,eol,start
syntax on

set background=dark
colorscheme apprentice

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

" Dispatch Shorts
nnoremap <silent> <leader>p8 :Dispatch flake8 %<CR>

" Toggle QuickFix/Location
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>


" Colors
hi ColorColumn ctermbg=236
hi Folded term=standout ctermfg=9 ctermbg=235 guifg=#6c6c6c guibg=#1c1c1c

" Folds
set fillchars="fold: "
setlocal foldtext=ManualFillCharText()

function! ManualFillCharText()
  let total = (v:foldend - v:foldstart)
  let init_chars = repeat('    ', foldlevel(v:foldstart))
  let actual = init_chars . '└──' . ' [ ' . total . ' ] '
  return actual . '────•'
endfunction
