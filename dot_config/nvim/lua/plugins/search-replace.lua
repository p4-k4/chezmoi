-- File: ~/.config/nvim/lua/plugins/search-replace.lua
return {
  {
    "nvim-lua/plenary.nvim", -- We don't actually need this, but showing proper plugin structure
    keys = {
      {
        "<leader>sr",
        function()
          local search = vim.fn.input("Search: ")
          if search == "" then
            return
          end
          local replace = vim.fn.input("Replace with: ")
          if replace == "" then
            return
          end
          local confirm = vim.fn.input("Confirm each replacement? (y/n): ")
          local flags = "ge"
          if confirm:lower() == "y" then
            flags = flags .. "c"
          end
          local command = string.format("%%s/%s/%s/%s", search:gsub("/", "\\/"), replace:gsub("/", "\\/"), flags)
          vim.cmd(command)
        end,
        desc = "Search and Replace",
      },
    },
  },
}
