return {
  "pysan3/neo-tree.nvim",
  branch = "restore-session-experimental",
  version = false,
  lazy = false,
  opts = {
    auto_restore_session_experimental = true,
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = true,
        -- hide_dotfiles = false,
        -- hide_gitignore = false,
      },
    },
  },
}
