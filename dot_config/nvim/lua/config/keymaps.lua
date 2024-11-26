-- Line navigation
vim.keymap.set("n", "<leader>gh", "^", { desc = "Move to start of line (non-whitespace)" })
vim.keymap.set("n", "<leader>gH", "0", { desc = "Move to very start of line" })
vim.keymap.set("n", "<leader>gl", "$", { desc = "Move to end of line" })
vim.keymap.set("n", "<leader>gj", "gj", { desc = "Move down (wrap-aware)" })
vim.keymap.set("n", "<leader>gk", "gk", { desc = "Move up (wrap-aware)" })
vim.keymap.set("n", "<leader>gm", "gm", { desc = "Move to middle of line" })

-- Document navigation
vim.keymap.set("n", "<leader>gt", "gg", { desc = "Move to top of document" })
vim.keymap.set("n", "<leader>gb", "G", { desc = "Move to bottom of document" })
-- vim.keymap.set("n", "'d", "<C-d>", { desc = "Move half page down" })
-- vim.keymap.set("n", "'u", "<C-u>", { desc = "Move half page up" })
-- vim.keymap.set("n", "'f", "<C-f>", { desc = "Move full page down" })
-- vim.keymap.set("n", "'r", "<C-b>", { desc = "Move full page up" })

-- Enhanced line operations
-- vim.keymap.set("n", "'y", "yy", { desc = "Yank entire line" })
-- vim.keymap.set("n", "'D", "dd", { desc = "Delete entire line" })
-- vim.keymap.set("n", "'c", "cc", { desc = "Change entire line" })

-- Visual mode line selection
vim.keymap.set("v", "<leader>vh", "0", { desc = "Select to start of line" })
vim.keymap.set("v", "<leader>vl", "$", { desc = "Select to end of line" })
vim.keymap.set("v", "<leader>vk", "gg", { desc = "Select to top of document" })
vim.keymap.set("v", "<leader>vj", "G", { desc = "Select to bottom of document" })

-- Visual selection of current line from first non-whitespace character
vim.keymap.set("n", "vv", "^vg_", { desc = "Select line content (no whitespace)" })

-- Navigation layer (Space)
vim.keymap.set("n", "<Space>h", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<Space>j", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<Space>k", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<Space>l", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<Space>n", "5j", { desc = "Move cursor 5 lines down" })
vim.keymap.set("n", "<Space>e", "5k", { desc = "Move cursor 5 lines up" })

-- File operations layer (,)
vim.keymap.set("n", "<Space>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<Space>q", "<Space>q<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- vim.keymap.set("n", ",f", ":Telescope find_files<CR>", { desc = "Find files" })
-- vim.keymap.set("n", ",g", ":Telescope live_grep<CR>", { desc = "Live grep" })
-- vim.keymap.set("n", ",b", ":Telescope buffers<CR>", { desc = "List buffers" })

-- LSP functions layer (.)
vim.keymap.set("n", ".d", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", ".D", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", ".i", vim.lsp.buf.implementation, { desc = "List implementations" })
vim.keymap.set("n", ".t", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
vim.keymap.set("n", ".r", vim.lsp.buf.references, { desc = "List references" })
vim.keymap.set("n", ".n", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", ".s", vim.lsp.buf.signature_help, { desc = "Show signature help" })
vim.keymap.set("n", ".a", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("v", ".a", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", ".f", vim.lsp.buf.format, { desc = "Format document" })
vim.keymap.set("n", ".h", vim.lsp.buf.hover, { desc = "Show hover information" })

-- Workspace management (on LSP layer)
vim.keymap.set("n", ".wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
vim.keymap.set("n", ".wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
vim.keymap.set("n", ".wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- Diagnostic navigation (on Navigation layer)
vim.keymap.set("n", "<Space>p", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<Space>n", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<Space>d", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
vim.keymap.set("n", "<Space>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to location list" })

-- Flutter operations layer (;)
vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Flutter Devices" })
vim.keymap.set("n", "<leader>fD", "<cmd>FlutterDetach<cr>", { desc = "Flutter Detach" })
vim.keymap.set(
  "n",
  "<leader>fm",
  "<cmd>FlutterRun --enable-experiment=macros<cr>",
  { desc = "Flutter Run with macros expiriment" }
)
vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })
vim.keymap.set("n", "<leader>fr", "<cmd>FlutterReload<cr>", { desc = "Flutter Reload" })
vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Flutter Restart" })
vim.keymap.set("n", "<leader>fu", "<cmd>FlutterPubUpgrade<cr>", { desc = "Flutter Pub Upgrade" })
vim.keymap.set("n", "<leader>fg", "<cmd>FlutterPubGet<cr>", { desc = "Flutter Pub Get" })

-- Quick access to common commands
vim.keymap.set("n", "<Space><Space>", ":", { desc = "Enter command mode" })

-- Alternative mappings for common operations (more Miryoku-friendly)
vim.keymap.set("n", "H", vim.lsp.buf.hover, { desc = "Show hover information" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Jump to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "List implementations" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Jump to type definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List references" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Use Tab and Shift-Tab for navigating completion menu
vim.keymap.set("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.keymap.set("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })
