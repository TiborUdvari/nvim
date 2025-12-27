require("conform").setup({
  formatters_by_ft = {
    astro = { "prettier", "prettierd", stop_after_first = true },
    mdx = { "prettier", "prettierd", stop_after_first = true },
    yaml = { "yamlfix" },
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettier", "prettierd", stop_after_first = true },
    typescript = { "prettier", "prettierd", stop_after_first = true },
    html = { "prettierd", stop_after_first = true },
    typescriptreact = { "prettier", "prettierd", stop_after_first = true }
  },
  formatters = {
    prettier = {
      command = "npx",
      args = { "prettier", "--stdin-filepath", "$FILENAME" },
      cwd = require("conform.util").root_file({
        ".prettierrc",
      }),
    },
  },
  default_format_opts = {
    async = true,
    lsp_fallback = true,
    timeout_ms=3000,
  },
})

vim.api.nvim_set_keymap('n', '<leader>cf', '<cmd>lua require("conform").format()<CR>', { noremap = true, silent = true })
