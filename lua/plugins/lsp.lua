local nvim_lsp = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      --      autoformat = false,
      servers = {
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
        denols = {

          offset_encoding = "utf-8",
          cmd = { "/opt/homebrew/bin/deno", "lsp" },
          filetypes = { "typescript", "typescriptreact" },
          root_dir = function(...)
            return nvim_lsp.util.root_pattern("deno.jsonc", "deno.json")(...)
          end,
          settings = {

            offset_encoding = "utf-8",
            deno = {
              offset_encoding = "utf-8",
              enable = true,
              lint = true,
              unstable = true,
              suggest = {
                imports = {
                  hosts = {
                    ["https://deno.land"] = true,
                  },
                },
              },
            },
          },
        },
        vtsls = {
          root_dir = nvim_lsp.util.root_pattern("package.json"),
          single_file_support = false,
        },
      },
    },
  },
}
