return {
  dir = vim.fn.expand("~/dev/ollama.nvim"),
  name = "ollama",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "Ollama",
    "OllamaGenerate",
    "OllamaTasks",
    "OllamaSettings",
    "OllamaPalette",
    "OllamaLogs", -- Add this line
  },
  keys = {
    { "<leader>oc", "<cmd>Ollama<cr>", desc = "Open Ollama Chat" },
    { "<leader>og", "<cmd>OllamaGenerate<cr>", desc = "Ollama Generate" },
    { "<leader>ot", "<cmd>OllamaTasks<cr>", desc = "Ollama Tasks" },
  },
  opts = {
    model = {
      name = "qwen2.5-coder",
      url = "http://localhost:11434",
      system_message = "You are a helpful AI assistant.",
    },
    window = {
      position = "right",
      width = 80,
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("ollama").setup(opts)
  end,
}
