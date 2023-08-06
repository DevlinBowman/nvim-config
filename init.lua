require("ven")
--

-- vim.cmd([[
--     command! LoadVen source ~/.config/nvim/lua/ven/init.lua
--     command! LoadSilver source ~/.config/nvim/lua/silver/init.lua
-- ]])



vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


-- opens help in vertical split
vim.cmd([[command! -nargs=1 -complete=help H vertical help <args>]])
vim.cmd([[command! -nargs=1 -complete=help Help vertical help <args>]])

-- netrw settings
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

