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
vim.o.swapfile = false
vim.wo.fillchars='eob: '

vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
-- vim.o.termguicolors = true
-- vim.o.background = 'dark'

-- Global Keymaps
vim.keymap.set('n', '<leader>o', '<cmd>e ~/.config/nvim/init.lua<CR>', { silent = true }) -- Open Config File
vim.keymap.set('n', '<leader>\\', '<cmd>noh<CR>', { silent = true }) -- Remove highlight
vim.keymap.set('n', '<C-l>', '<cmd>bn<CR>', { silent = true }) -- Next Buffer
vim.keymap.set('n', '<C-h>', '<cmd>bp<CR>', { silent = true }) -- Previous Buffer
vim.keymap.set('n', '<leader>b', '<cmd>bp|bd #<CR>', { silent = true }) -- Unload Buffer but keep split
vim.keymap.set('n', '<leader>c', '<C-w>c', { silent = true }) -- Close window

-- Terminal Related
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })      -- normal mode
vim.api.nvim_command("autocmd TermOpen * startinsert")             -- starts in insert mode
vim.api.nvim_command("autocmd TermOpen * setlocal nonu nornu")       -- no numbers
vim.api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

-- Floatterm Related
vim.keymap.set('n', '<leader>t', '<cmd>FloatermToggle<CR>', { silent = true }) -- Toggle Floatterm
vim.keymap.set('t', '<leader>t', '<cmd>FloatermToggle<CR>', { silent = true }) -- Toggle Floatterm

-- Play Eye
vim.keymap.set('n', '<leader>ai', ":lua arun({'python', 'parser.py', '--zero', vim.fn.expand('%')})<CR>", { silent = true})

-- Plugins

require('lazy').setup({
  'voldikss/vim-floaterm',
  'Vimjas/vim-python-pep8-indent', -- No better way of doing python indent
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-fugitive', -- Git integration
  'tpope/vim-rhubarb', -- Github integration
  { -- Comment Lines and Regions
    'numToStr/Comment.nvim',
    opts = {}
  },

  { -- Color Scheme
    -- 'shaunsingh/nord.nvim',
    -- 'navarasu/onedark.nvim',
    -- 'arcticicestudio/nord-vim',
    -- 'morhetz/gruvbox',
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {  -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live Grep'})
      vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', { desc = 'Grep String'})
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find Buffers'})
      vim.keymap.set('n', '<leader>fr', '<cmd>Telescope file_browser<cr>', { desc = 'File Browser'})
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help Tags'})
      vim.keymap.set('n', '<leader>fc', '<cmd>Telescope git_commits<cr>', { desc = 'Git Commits'})
      vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Key Maps'})
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  { -- Status Bar
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
        globalstatus=true,
        theme = 'catppuccin',
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          function()
            return '[' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ']'
          end,
          { 'filename', path = 1 }, -- Show only the base filename
        },
        lualine_x = {},
        lualine_y = {},

      },
    },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
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

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
  },


  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
  },

  { -- Pretty Quickfix
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { },
  },

  { -- Copilot
    "github/copilot.vim",
  },

  {
    'omaraboumrad/telescope-extra-actions.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
    }
  },

  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}

}, {})

-- LSP Configuration
--
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local on_attach = function(_, bufnr)

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame'})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction'})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: [G]oto [D]efinition'})
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration'})
  vim.keymap.set('n', '<leader>v', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', { silent = true })
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'LSP: [G]oto [R]eferences'})
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = 'LSP: [G]oto [I]mplementation'})
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'LSP: Type [D]efinition'})
  vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP: [D]ocument [S]ymbols'})
  vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'LSP: [W]orkspace [S]ymbols'})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover Documentation'})
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation'})
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature Documentation'})
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'LSP: [W]orkspace [A]dd Folder'})
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'LSP: [W]orkspace [R]emove Folder'})
  vim.keymap.set('n', '<leader>wl', (function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end), '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  pyright = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

-- CMP Configuration

local cmp = require 'cmp'
local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Treesitter Configuration
-- See `:help nvim-treesitter`

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'javascript', 'vimdoc', 'vim', 'json', 'jsonc' },
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

local actions = require "telescope.actions"
local extra_actions = require "telescope-extra-actions"
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<leader>p'] = require('telescope.actions.layout').toggle_preview
      }
    },
    preview = {
      hide_on_startup = true -- hide previewer when picker starts
    },
    layout_config = {
      width = 0.50,
      height = 0.50,
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    },
    find_files = {
      mappings = {
        i = {
          ["<c-d>"] = extra_actions.delete_file,
        }
      }
    },
  }
})

require("telescope").load_extension "file_browser"

local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}


vim.cmd [[ set runtimepath^=~/.config/nvim/telescope-chdir.nvim ]]
vim.cmd [[ command! ChdirTelescope lua require('chdir').change_directory() ]]
-- vim.cmd [[ hi SignColumn ctermbg=guibg ]]
-- vim.cmd [[ hi FloatermBorder ctermbg=guibg ]]
--
--

function arun(command)
  -- Internal buffering is required.
  -- Partly because I suck at lua, so
  -- had to figure out a way to deal with
  -- the nvim_buf_set_lines not allowing newlines
  local buffer = ""

  local function on_out(_, data)
    if data then
      for _, line in ipairs(data) do
        buffer = buffer .. line

        while true do
          local newline_index = buffer:find("\n") or buffer:find("\0")
          if not newline_index then break end

          local line_to_set = buffer:sub(1, newline_index - 1)
          buffer = buffer:sub(newline_index + 1)

          local line_count = vim.api.nvim_buf_line_count(0)
          vim.api.nvim_buf_set_lines(0, line_count, line_count, false, {line_to_set})
        end
      end
    end
  end

  vim.fn.jobstart(command, {
    on_stdout = on_out,
    on_stderr = on_out,
    stdout_buffered = false,
    stderr_buffered = false
  })
end
