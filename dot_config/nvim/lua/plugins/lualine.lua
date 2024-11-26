return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = {
    options = {
      theme = "tokyonight",
      transparent = true,
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
      disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
          padding = { left = 0, right = 1 },
          separator = { left = "", right = "" },
        },
      },
      lualine_b = {
        {
          "branch",
          fmt = function(str)
            return str:sub(1, 8)
          end,
        },
      },
      lualine_c = {
        { "filename", path = 1 },
      },
      lualine_x = {
        "filetype",
        {
          "diagnostics",
          symbols = {
            error = "E:",
            warn = "W:",
            info = "I:",
            hint = "H:",
          },
          colored = true,
        },
      },
      lualine_y = { "progress" },
      lualine_z = {
        {
          "location",
          padding = { left = 0, right = 0 },
          separator = { left = "", right = "" },
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "neo-tree" },
  },
}
