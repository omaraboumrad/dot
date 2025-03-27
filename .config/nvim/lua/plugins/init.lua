return {
  'Vimjas/vim-python-pep8-indent',
  'tpope/vim-sleuth',
  'tpope/vim-fugitive',
  'numToStr/Comment.nvim',

  {
    'kdheepak/monochrome.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'monochrome'
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
}
