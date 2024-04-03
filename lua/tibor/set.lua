-- tibor
-- todo debug this
--- found in the folding user doc
-- Remap the [ ] keys

-- Remap for nvim tree

-- global
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

-- Remaps (mainly for my Swiss keyboard)
vim.api.nvim_set_keymap('n', 'è', '[', {noremap = true})
vim.api.nvim_set_keymap('n', '¨', ']', {noremap = true})
-- dead keys

-- Folding
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldmethod = "syntax"
vim.o.foldcolumn = '4' -- UI for folding

-- setup tree sitter based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true -- case sentive for queries with capital letters

-- Mouse
-- vim.o.mouse = 'a' -- not working currently, maybe issue with tmux

-- primagen
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.updatetime = 50

vim.opt.scrolloff = 8
-- vim.opt.termguicolors = true

-- don't super like this though
-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

