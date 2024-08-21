require("conform").setup({
  formatters_by_ft = {
    astro = { "prettierd", "prettier", stop_after_first = true },
    yaml = { "yamlfix" },
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", stop_after_first = true }
  },
  async = true,
  lsp_fallback = true,
})

vim.api.nvim_set_keymap('n', '<leader>cf', '<cmd>lua require("conform").format()<CR>', { noremap = true, silent = true })
