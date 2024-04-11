-- installed with lsp zero
local luasnip = require("luasnip")
local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local cmp_format = require('lsp-zero').cmp_format({details = true})

luasnip.snippets = {
  all = {
    luasnip.parser.parse_snippet("tib", "--hi tib"),
  },
}

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  preselect = 'item',
  sources = {
    -- {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert({
    -- supertab behaviour
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = cmp_format,
})
