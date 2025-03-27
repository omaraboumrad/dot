return {
  "github/copilot.vim",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({ })
      vim.keymap.set('i', '<C-y>', 'copilot#Accept("<CR>")', {expr=true, silent=true})
    end,
  },
}
