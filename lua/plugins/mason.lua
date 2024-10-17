return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "php-debug-adapter",
      "js-debug-adapter",
      "intelephense",
      "deno",
      "blade-formatter",
      "gopls",
      "go-debug-adapter",
    },
  },
}
