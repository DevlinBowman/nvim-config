    -- -- MASTER & KEY -- -- 
    -- ------------------ --
-- Unmap weird arrow keys
vim.api.nvim_set_keymap('n', '<D-Left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<D-Right>', '<Nop>', {noremap = true, silent = true})

-- Set space as leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --"Project View"
-- Remap Ctrl+C and ;; in insert mode to escape insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", ";;", "<ESC>")
-- Unmap Q
vim.keymap.set("n", "Q", "<nop>")
-- jump between non-indented lines
vim.keymap.set("n", "<Leader>]", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("/^\\S\n", true, false, true), 'n', true)
end)
vim.keymap.set("n", "<Leader>[", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("?^\\S\n", true, false, true), 'n', true)
end)

    -- -- SHORTCUTS -- -- 
    -- --------------- -- 
-- Remap <leader><leader> to source current file
vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
end)
-- Remap Shift+E to go to end of line
vim.keymap.set("n", "<S-e>", "$") --"END"
-- Easy Buffer Delete 
vim.keymap.set('n', '<leader>dd', ':bdelete<CR>', { silent = true }) --"Delete Delete"
-- East Buffer Delete and push to next **Delete + Push
vim.keymap.set('n', '<leader>dp', ':bnext | bd#<CR>', { silent = true }) --"Delete + Push"


    -- -- MACROS -- --
    -- ------------ --
-- Remap <leader>s to search and replace current word
vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --"Search + Sub"
-- Remap <leader>x to make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- remap <leader> rws to remove all trailing whitespace
vim.keymap.set("n", "<leader>rws", [[:%s/\s\+$//e<CR>]], { silent = true }) --"Remove Whitespace"


    -- -- NICHE -- -- 
    -- ----------- --
-- Remap J and K to move visual blocks up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Remap J to keep cursor in place after joining lines
vim.keymap.set("n", "J", "mzJ`z")


    -- -- READER & VISUAL -- -- 
    -- ------------------ -- -- 
-- Remap Ctrl+D and Ctrl+U to scroll down and up and recenter
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Remap n and N to center screen after jumping to the next or previous search match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Remap <leader>p in visual mode to delete and paste visual block 
vim.keymap.set("x", "<leader>p", [["_dP]])


    -- -- CLIPBOARD & YDP -- -- 
    -- --------------------- -- 
-- Remap <leader>gp to delete file contents and paste from system CLIPBOARD
vim.api.nvim_set_keymap('n', '<leader>dp', [[ggdG"*p]], { noremap = true, silent = true })
-- Remap <leader>y and <leader>Y to copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Remap <leader>ya to yank all text to system clipboard
vim.keymap.set("n", "<leader>ya", 'gg0vG$"*y')
-- Remap <leader>yy in visual mode to yank to system clipboard
vim.keymap.set("v", "<leader>yy", '"*y')
-- Remap <leader>d to delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- Remap <leader>o and <leader>O to insert line below or above and go to end of line
vim.keymap.set("n", "<leader>o", "o<ESC>k$")
vim.keymap.set("n", "<leader>O", "O<ESC>j$")


    -- -- SOFTWARE SPECIFIC -- -- 
    -- ----------------------- -- 
-- Remap <leader>p to save and run Python script
vim.keymap.set('n', '<leader>gp', ':w <bar> !python3 %<CR>', {noremap = true, silent = true}) -- "Go + Python"
-- Remap <leader>ff to format with LSP
vim.keymap.set('n', '<leader>ff', ':LspZeroFormat<CR>', {}) -- "Format File"
-- Remap Ctrl+F to start new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Remap <leader>f to format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
-- Remap Ctrl+K and Ctrl+J to go to next and previous error
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Remap <leader>k and <leader>j to go to next and previous location
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


    -- -- PANE NAVIGATION -- -- 
-- Remap arrows to navigate between windows
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<right>", "<C-w>l")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<down>", "<C-w>j")

-- Remap Shift+arrows to cycle buffers
vim.keymap.set("n", "<S-left>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<S-right>", "<cmd>bnext<CR>")
--vim.keymap.set("i", "<S-left>", "<cmd>bprevious<CR>")
--vim.keymap.set("i", "<S-right>", "<cmd>bnext<CR>")
-- vim.keymap.set('n', '<S-Up>', ':Telescope buffers<CR>')
vim.keymap.set('n', '<S-Down>', ':bdelete<CR>')
-- Remap <leader>nu to search for numbers
vim.keymap.set('n', '<leader>nu', '/\\d\\+<CR>', {})


    -- -- PLUGIN REMAPS -- -- 
    -- ------------------- --
    -- LOCATED AT:
    --      nvim/after/plugin/plugin-name
