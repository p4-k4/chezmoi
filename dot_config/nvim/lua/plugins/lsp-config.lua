return {
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        elixirls = {
          enabled = true,
        },
        -- lexical = {
        --   elixirPath = vim.fn.trim(vim.fn.system("asdf which elixir")),
        --   erlangPath = vim.fn.trim(vim.fn.system("asdf which erl")),
        --   projectDir = "${workspaceFolder}",
        --   mason = false, -- Don't use mason to install lexical
        --   cmd = { "/Users/paka/dev/lexical/_build/dev/package/lexical/bin/start_lexical.sh" }, -- Update this path
        --   filetypes = { "elixir", "eelixir", "heex" },
        --   root_dir = require("lspconfig.util").root_pattern("mix.exs", ".git"),
        --   init_options = {
        --     enableDefinitionLinks = true,
        --     enableReferences = true,
        --   },
        --   settings = {
        --     -- Optional lexical-specific settings
        --     lexical = {
        --       -- Add any specific settings here
        --       checkForDebuggerEnabled = true,
        --       suggestSpecs = true,
        --       elixirLS = {
        --         fetchDeps = true,
        --         enableTestLenses = true,
        --       },
        --     },
        --   },
        -- },
        tailwindcss = {
          filetypes = { "html", "heex", "css" }, -- Remove elixir/eelixir from filetypes
          root_dir = require("lspconfig.util").root_pattern(
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.mjs",
            "tailwind.config.ts",
            "postcss.config.js",
            "postcss.config.cjs",
            "postcss.config.mjs",
            "postcss.config.ts"
          ),
        },
      },
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              'class[:]\\s*"([^"]*)"',
            },
          },
        },
      },
    },
  },
}
