-- disable netrw at the very start of your init.lua
-- this is for nvim-tree that replaces it

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("tibor.remap")
require("tibor.set")

vim.cmd([[colorscheme catppuccin]])
