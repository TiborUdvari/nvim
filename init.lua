require("tibor")

--vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufEnter" }, {
--  pattern = { "*.jpeg", "*.jpg", "*.png", "*.gif", "*.webp" },
--  callback = function()
--    -- vim.fn.jobstart({"killall", "feh"})
--    local filepath = vim.fn.expand("%:p")
--    vim.fn.jobstart({ "feh", "--title", "feh_img", "--no-focus", filepath }, { detach = true })
--    vim.api.nvim_command("sleep 100ms") -- Use Neovim API for sleep (adjust time as needed)
--    vim.fn.jobstart({ "wmctrl", "-r", "feh_img", "-b", "add,above" }, { detach = true })
--    vim.cmd("echomsg 'Opening an image file.'") -- Use echomsg for better handling
--  end,
--})
--
---- vim.api.nvim_create_autocmd("BufLeave", {
----     pattern = {"*.jpeg", "*.jpg", "*.png", "*.gif", "*.webp"},
----     callback = function()
----         vim.fn.jobstart({"killall", "feh"}, {detach = true})
----     end,
---- })
--
--vim.api.nvim_set_keymap('n', '§', ':silent !killall feh<CR>', {noremap = true, silent = true})
--
---- Maybe will help with slowness
--vim.g.loaded_matchparen = 1

