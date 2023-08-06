-- solves the copilot tab-complete conflict
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Copilot Remaps
-- set otpion+k to push to previous suggestion
vim.keymap.set('i', '˚', '<Plug>(copilot-previous)', {noremap = true, silent = true})
-- set option+l to push to next suggestion
vim.keymap.set('i', '¬', '<Plug>(copilot-next)', {noremap = true, silent = true})


