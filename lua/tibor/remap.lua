vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remap for nvim tree
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

-- Remaps (mainly for my Swiss keyboard)
vim.api.nvim_set_keymap('n', 'è', '[', {noremap = true})
vim.api.nvim_set_keymap('n', '¨', ']', {noremap = true})

vim.api.nvim_set_keymap('i', 'è', '[', {noremap = true})
vim.api.nvim_set_keymap('i', '¨', ']', {noremap = true})

vim.api.nvim_set_keymap('i', 'à', '{', {noremap = true})
vim.api.nvim_set_keymap('i', '$', '}', {noremap = true})

vim.api.nvim_set_keymap('i', '§', '$', {noremap = true})

-- Remap for LSP
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})

