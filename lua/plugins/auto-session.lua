return {
  "rmagatti/auto-session",
  lazy = false,

  config = function()
    require("auto-session").setup({
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
      auto_session_enable_last_session = false,
      auto_session_last_session_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      log_level = vim.log.levels.ERROR,
      auto_save_enabled = true,
      auto_session_create_enabled = true,
      pre_save_cmds = { "tabdo Neotree close" },
      post_restore_cmds = { "Neotree" },
      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
        -- path_display = { "shorten" },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
    keymap.set("n", "<leader>wl", require("auto-session.session-lens").search_session, {
      desc = "List saved sessions",
      noremap = true,
    })
  end,
}
