
    -- -- MASTER & KEY -- -- 
    -- ------------------ --
-- Set space as leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --"Project View"
-- Remap Ctrl+C and ;; in insert mode to escape insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", ";;", "<ESC>")
-- Unmap Q
vim.keymap.set("n", "Q", "<nop>")


    -- -- SHORTCUTS -- -- 
    -- --------------- -- 
-- Remap <leader><leader> to source current file
vim.keymap.set("n", "<leader><leader>", function()
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
vim.keymap.set('n', '<S-Up>', ':Telescope buffers<CR>')
vim.keymap.set('n', '<S-Down>', ':bdelete<CR>')
-- Remap <leader>nu to search for numbers
vim.keymap.set('n', '<leader>nu', '/\\d\\+<CR>', {})


    -- -- PLUGIN REMAPS -- -- 
    -- ------------------- --
-- Telescope Remaps
vim.keymap.set('n', '<leader>th', ':Telescope help_tags<CR>', { silent = true }) -- "Telescope Help"
vim.keymap.set('n', '<leader>tr', ':Telescope registers<CR>', { silent = true }) -- "Telescope Registers"
vim.keymap.set('n', '<leader>pb', ':Telescope buffers<CR>', { silent = true }) -- "Project Buffers"
vim.keymap.set('n', '<leader>pp', ':Telescope current_buffer_fuzzy_find<CR>', { silent = true }) -- "Project Pages"
vim.keymap.set('n', '<leader>pg', ':Telescope live_grep<CR>', { silent = true }) -- "Project Grep"

-- Copilot Remaps
-- set otpion+k to push to previous suggestion
vim.keymap.set('i', '˚', '<Plug>(copilot-previous)', {noremap = true, silent = true})
-- set option+l to push to next suggestion
vim.keymap.set('i', '¬', '<Plug>(copilot-next)', {noremap = true, silent = true})

-- Nerdree Remaps
-- vim.remap.set('n', '<leader>n', ':NERDTreeToggle<CR>', { silent = true })
