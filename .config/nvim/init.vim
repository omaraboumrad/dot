call plug#begin()

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'arcticicestudio/nord-vim'

Plug 'vim-airline/vim-airline'

Plug 'lifepillar/vim-solarized8'

Plug 'mattn/emmet-vim'

Plug 'SirVer/ultisnips'
Plug 'andrewstuart/vim-kubernetes'

call plug#end()

" Telescope Setup
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>


" Base
set rnu
set hidden
set list
set listchars=eol:↓,trail:·
set ts=4 expandtab
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F2>
set splitright
set splitbelow
set nobackup
set noswapfile

colorscheme nord


nmap <silent> <C-l> :bn<CR>
nmap <silent> <C-h> :bp<CR>
map <silent> <leader>\ :noh<CR>

" Toggle QuickFix/Location
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>
let g:airline_powerline_fonts = 1

lua << EOF
    require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 
EOF

" Ulti Snips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
