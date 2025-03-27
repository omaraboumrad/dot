return {

  {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function(_, opts)
      vim.keymap.set('n', '<leader>t', '<cmd>Oil<CR>', { silent = true })

      require('oil').setup(opts)
    end
  }

}
