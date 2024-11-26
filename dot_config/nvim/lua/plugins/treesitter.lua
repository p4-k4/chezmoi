return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "dart", "elixir", "heex", "eex", "html", "css" },
    highlight = {
      enable = true,
      custom_captures = {
        ["function.dart"] = "Identifier",
      },
    },
  },
}
