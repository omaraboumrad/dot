return {
  {  -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live Grep'})
      vim.keymap.set('n', '<leader>fs', '<cmd>Telescope grep_string<cr>', { desc = 'Grep String'})
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Find Buffers'})
      vim.keymap.set('n', '<leader>fr', '<cmd>Telescope file_browser<cr>', { desc = 'File Browser'})
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help Tags'})
      vim.keymap.set('n', '<leader>fc', '<cmd>Telescope git_commits<cr>', { desc = 'Git Commits'})
      vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Key Maps'})

      local function current_buffer_fuzz()
        require('telescope.builtin').current_buffer_fuzzy_find()
      end

      vim.keymap.set("n", "<leader>fz", current_buffer_fuzz, { desc = "Fuzzy search current buffer" })

    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    }
  },

  "nvim-telescope/telescope-ui-select.nvim",

  {
    'omaraboumrad/telescope-extra-actions.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim",
    }
  },
}
