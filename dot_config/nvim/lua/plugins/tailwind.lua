-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  },
  opts = {
    document_color = {
      enabled = false,
      kind = "background", -- or "foreground"
    },
    conceal = {
      enabled = false,
      symbol = "󱏿", -- or any other symbol you want
    },
    custom_filetypes = {
      "elixir",
      "eex",
      "heex",
      "surface",
    },
    cmp = {
      highlight = "background", -- color preview style, "foreground" | "background"
    },
    telescope = {
      utilities = {
        callback = function(name, class) end, -- callback used when selecting an utility class in telescope
      },
    },
    extension = {
      queries = {}, -- a list of filetypes having custom `class` queries
      patterns = { -- a map of filetypes to Lua pattern lists
        -- example:
        -- rust = { "class=[\"']([^\"']+)[\"']" },
        -- javascript = { "clsx%(([^)]+)%)" },
      },
    },
  },
}
