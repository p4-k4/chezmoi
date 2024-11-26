local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-project.nvim",
  },
  keys = {
    { "<leader>fR", false },
    { "<leader>/", ":Telescope file_browser path=%:p:h select_buffer=true previewer=false<cr>" },
    { "<leader>'", ":Telescope project<cr>" },
    { "<leader>.", "<cmd>Telescope find_files<cr>" },
    { "<leader>,", "<cmd>Telescope buffers<cr>" },
    { "<leader>K", "<cmd>Telescope keymaps<cr>" },
    { "<leader>td", "<cmd>Telescope diagnostics<cr>" },
    { "<leader>tt", "<cmd>Telescope colorscheme<cr>" },
  },
  config = function()
    local project_actions = require("telescope._extensions.project.actions")
    require('telescope').setup({
      defaults = {
        pickers = {
          sort_lastused = true,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        project = {
          base_dirs = {
            "~/dev/",
          },
          hidden_files = false,
          theme = "dropdown",
          order_by = "recent",
          search_by = "title",
          sync_with_nvim_tree = false,
          mappings = {
            n = {
              ["d"] = project_actions.delete_project,
              ["r"] = project_actions.rename_project,
              ["c"] = project_actions.add_project,
              ["C"] = project_actions.add_project_cwd,
              ["f"] = project_actions.find_project_files,
              ["b"] = project_actions.browse_project_files,
              ["s"] = project_actions.search_in_project_files,
              ["R"] = project_actions.recent_project_files,
              ["w"] = project_actions.change_working_directory,
              ["o"] = project_actions.next_cd_scope,
            },
            i = {
              ["<c-d>"] = project_actions.delete_project,
              ["<c-v>"] = project_actions.rename_project,
              ["<c-a>"] = project_actions.add_project,
              ["<c-A>"] = project_actions.add_project_cwd,
              ["<c-f>"] = project_actions.find_project_files,
              ["<c-b>"] = project_actions.browse_project_files,
              ["<c-s>"] = project_actions.search_in_project_files,
              ["<c-r>"] = project_actions.recent_project_files,
              ["<c-l>"] = project_actions.change_working_directory,
              ["<c-o>"] = project_actions.next_cd_scope,
              ["<c-w>"] = project_actions.change_workspace,
            }
          }
        }
      }
    })
    require('telescope').load_extension('project')
  end,
}
