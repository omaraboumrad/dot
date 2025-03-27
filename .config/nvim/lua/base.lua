-- Base Settings
--
vim.o.nu = true
vim.o.rnu = true
vim.o.hidden = true
vim.o.list = true
vim.o.listchars = "eol:↓,trail:·"
vim.o.expandtab = true

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.wo.fillchars='eob: '

vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'

vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Base Keymaps

vim.keymap.set('n', '<leader>o', '<cmd>e ~/.config/nvim/init.lua<CR>', { silent = true })
vim.keymap.set('n', '<leader>\\', '<cmd>noh<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', '<cmd>bn<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', '<cmd>bp<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', '<cmd>bp|bd #<CR>', { silent = true })
vim.keymap.set('n', '<leader>c', '<C-w>c', { silent = true })
