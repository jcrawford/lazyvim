return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "aaronhallaert/advanced-git-search.nvim",
    "nvim-telescope/telescope-github.nvim",
    "jvgrootveld/telescope-zoxide",
  },
  branch = "master",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    { "<leader><space>", false },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep Word" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Show Workspace Diagnostics" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Show Workspace Diagnostics" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
    { "<leader>zz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },

    { "<leader>pr", "<cmd>Telescope gh pull_request<cr>", desc = "Github Pull Requests" },
  },
  config = function()
    local actions = require("telescope.actions")
    local trouble_telescope = require("trouble.sources.telescope")
    local z_utils = require("telescope._extensions.zoxide.utils")
    require("telescope").setup({
      defaults = {
        wrap_results = true,
        sorting_strategy = "ascending",
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-t>"] = trouble_telescope.open,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        zoxide = {
          prompt_title = "[ Zoxide List ]",

          -- Zoxide list command with score
          list_command = "zoxide query -ls",
          mappings = {
            default = {
              action = function(selection)
                vim.cmd.cd(selection.path)
              end,
              after_action = function(selection)
                vim.notify("Directory changed to " .. selection.path)
              end,
            },
            ["<C-s>"] = { action = z_utils.create_basic_command("split") },
            ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
            ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
            ["<C-f>"] = {
              keepinsert = true,
              action = function(selection)
                builtin.find_files({ cwd = selection.path })
              end,
            },
            ["<C-t>"] = {
              action = function(selection)
                vim.cmd.tcd(selection.path)
              end,
            },
          },
        },
      },
    })
  end,
}
