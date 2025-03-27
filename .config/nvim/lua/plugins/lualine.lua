return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
        globalstatus=true,
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
}
