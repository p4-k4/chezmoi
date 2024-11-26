return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  keys = {
    { "<leader>fd", "<cmd>FlutterDevices<cr>" },
    { "<leader>fD", "<cmd>FlutterDetach<cr>" },
    { "<leader>ff", "<cmd>FlutterRun<cr>" },
    { "<leader>fq", "<cmd>FlutterQuit<cr>" },
    { "<leader>fr", "<cmd>FlutterReload<cr>" },
    { "<leader>fR", "<cmd>FlutterRestart<cr>" },
    { "<leader>fpu", "<cmd>FlutterPubUpgrade<cr>" },
    { "<leader>fpg", "<cmd>FlutterPubGet<cr>" },
  },
  opts = {
    dev_log = {
      enabled = true,
      notify_errors = false, -- if there is an error whilst running then notify the user
      open_cmd = "botright split", -- command to use to open the log buffer
    },
    device = true,
    widget_guides = {
      enabled = true,
    },
    ui = {
      border = "rounded",
      notification_style = "native",
    },
    decorations = {
      statusline = {
        app_version = false,
        device = true,
      },
    },
    debugger = {
      enabled = false,
      run_via_dap = false,
    },
  },
}
