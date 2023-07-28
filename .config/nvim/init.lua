-- Bootstrap Lazy Package Manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Base Configuration

vim.o.nu = true
vim.o.rnu = true
vim.o.hidden = true
vim.o.list = true
vim.o.listchars = "eol:↓,trail:·"
vim.o.expandtab = true
vim.o.pastetoggle = "<F2>"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true

-- Global Keymaps
vim.keymap.set({ 'n' }, '<leader>o', '<cmd>e ~/.config/nvim/init.lua<CR>', { silent = true }) -- Open Config File
vim.keymap.set({ 'n' }, '<leader>\\', '<cmd>noh<CR>', { silent = true }) -- Remove highlight
vim.keymap.set({ 'n' }, '<C-l>', '<cmd>bn<CR>', { silent = true }) -- Next Buffer
vim.keymap.set({ 'n' }, '<C-h>', '<cmd>bp<CR>', { silent = true }) -- Previous Buffer

-- Plugins

require('lazy').setup({
  'Vimjas/vim-python-pep8-indent', -- No better way of doing python indent
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive', -- Git integration
  'tpope/vim-rhubarb', -- Github integration

  { -- Comment Lines and Regions
    'numToStr/Comment.nvim',
    opts = {}
  },

  { -- Color Scheme
    'shaunsingh/nord.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'nord'
    end,
  },

  {  -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- file_ignore_patterns = { 'node_modules', '*.svg' },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files'},
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep'},
      { '<leader>fs', '<cmd>Telescope grep_string<cr>', desc = 'Grep String'},
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find Buffers'},
      { '<leader>fr', '<cmd>Telescope file_browser<cr>', desc = 'File Browser'},
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags'},
      { '<leader>fc', '<cmd>Telescope git_commits<cr>', desc = 'Git Commits'},
    },
  },


  { -- Status Bar
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = {
          function()
            return '[' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ']'
          end,
          { 'filename', path = 1 }, -- Show only the base filename
        },
      },
    },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    -- ensure_installed = { "python", "javascript", "vimdoc", "html" },
    -- highlight = { enable = true },
    -- indent = {enable = true }
  },

  { -- Add Git Signs
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  { -- Indentation Character
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
      show_end_of_line = true,
    },
  },


}, {})
