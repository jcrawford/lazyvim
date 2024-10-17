return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- sidebars = "transparent",
      -- floats = "transparent",
    },
    on_colors = function(colors)
      colors.border = "#565f89"
    end,
  },
}
