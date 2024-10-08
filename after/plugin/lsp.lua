local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
end)


-- Handle setup with mason https://lsp-zero.netlify.app/v3.x/getting-started.html

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {'html', 'tsserver', 'astro', 'wgsl_analyzer', 'glsl_analyzer'},
  handlers = {
    lsp_zero.default_setup,
    wgsl_analyzer = function ()
      require'lspconfig'.wgsl_analyzer.setup({})
    end,
    glsl_analyzer = function ()
      require'lspconfig'.glsl_analyzer.setup{}
    end,
    html = function()
      require('lspconfig').html.setup({
        capabilities = capabilities,
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true
          },
          provideFormatter = true
        },
        single_file_support = true
      })
    end,
  },
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})

vim.filetype.add({
  extension = {
    vert = "glsl",
  },
})

---
-- Autocompletion config
---
-- local cmp = require('cmp')
-- local cmp_action = lsp_zero.cmp_action()
-- local cmp_format = require('lsp-zero').cmp_format({details = true})
--
-- cmp.setup({
--   preselect = 'item',
--   sources = {
--     {name = 'nvim_lsp'},
--     {name = 'luasnip'},
--   },
--   formatting = cmp_format,
--   completion = {
--     completeopt = 'menu,menuone,noinsert',
--   },
--   mapping = cmp.mapping.preset.insert({
--     -- `Enter` key to confirm completion
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
--
--     -- Ctrl+Space to trigger completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
--
--     -- Navigate between snippet placeholder
--     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--
--     -- Scroll up and down in the completion documentation
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-d>'] = cmp.mapping.scroll_docs(4),
--   })
-- })

--
-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
--
-- lsp.setup()
--
-- -- new stuff here
-- local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
--
-- cmp.setup({
--   mapping = {
--     ['<Tab>'] = cmp.mapping.confirm({select = true}),
--   }
-- })
