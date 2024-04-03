local telescope = require("telescope")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- disables folding for telescope results
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function()
    vim.wo.foldenable = false
  end,
})

-- More setup for later 
-- telescope.setup({})
