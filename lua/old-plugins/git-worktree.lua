return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    require("git-worktree").setup()
    require("telescope").load_extension("git_worktree")

    vim.keymap.set("n", "<leader>sr", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
    vim.keymap.set("n", "<leader>sR", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

    local Worktree = require("git-worktree")
    Worktree.on_tree_change(function(op, metadata)
      if op == Worktree.Operations.Create or op == Worktree.Operations.Switch then
        -- create link from metadata.path to ~/docker/src/xxx
        local path = vim.split(metadata.path, "/")
        -- cleanup table after split
        table.remove(path, 1)
        table.remove(path, #path)
        table.remove(path, 4)

        if path[4] == "microservices" then
          path[4] = "local-microservices"
        end

        local newPath = "/" .. table.concat(path, "/")
        os.execute("ln -s " .. metadata.path .. " " .. newPath)
        if path[4] == "local-microservices" or path[4] == "src" then
          local project = path[#path]
          -- os.execute("docker restart " .. project)
        end
        -- os.execute("docker restart " .. project)
        -- print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
      end
    end)
  end,
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
}
