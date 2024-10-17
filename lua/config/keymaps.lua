-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
vim.keymap.set("n", "yd", "ggyG", { desc = "Yank entire document " })

-- Git worktree configuration commented out for now until I can figure out
-- the best way to create the docker symlinks from the git-worktree hooks.

-- this has to be changed as the default keymap is <leader>sr and I want that for worktrees.
vim.keymap.set("n", "sf", function()
  require("spectre").open()
end, { desc = "Replace in Files (Spectre)" })

-- vim.keymap.set("n", "<leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
-- vim.keymap.set("n", "<leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
vim.keymap.set("n", "<leader>ld", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart LSP", noremap = true })

vim.keymap.set("n", "<leader>go", "<cmd>GitBlameOpenCommitURL<CR>", { desc = "Open commit URL" })
-- delete entire document contents
vim.keymap.set("n", "DD", "ggdG", { desc = "Delete entire document" })
