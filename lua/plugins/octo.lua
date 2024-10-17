return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("octo").setup({
      enable_bultin = true,
      mappings = {
        submit_win = {
          approve_review = { lhs = "<leader>apr", desc = "approve review" },
          comment_review = { lhs = "<leader>copr", desc = "comment review" },
          request_changes = { lhs = "<leader>rcpr", desc = "request changes review" },
          close_review_tab = { lhs = "<leader>cpr", desc = "close review tab" },
        },
      },
    })
    vim.cmd([[hi OctoEditable guibg=none]])
    vim.treesitter.language.register("markdown", "octo")
  end,

  keys = {
    { "<leader>o", "<cmd>Octo actions<cr>", desc = "Octo" },
    { "<leader>op", "<cmd>Octo pr list<cr>", desc = "Octo List Pr" },
    { "<leader>os", "<cmd>Octo review start<cr>", desc = "Octo Start Review" },
    { "<leader>oS", "<cmd>Octo review submit<cr>", desc = "Octo Submit Review" },
  },
}
