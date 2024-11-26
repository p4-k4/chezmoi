return {
  "ahmedkhalf/project.nvim",
  opts = {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pubspec.yaml" },
  },
  event = "VeryLazy",
  config = function(_, opts)
    require("project_nvim").setup(opts)
    LazyVim.on_load("telescope.nvim", function()
      require("telescope").load_extension("projects")
    end)
  end,
}
