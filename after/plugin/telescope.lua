
local builtin = require('telescope.builtin')

-- Set up Telescope
require('telescope').setup {
    defaults = {
        -- Ignoring .pyc files
        file_ignore_patterns = {"%.pyc$"},
    },
}

-- Key mappings
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Telescope Remaps
vim.keymap.set('n', '<leader>th', ':Telescope help_tags<CR>', { silent = true }) -- "Telescope Help"
vim.keymap.set('n', '<leader>tr', ':Telescope registers<CR>', { silent = true }) -- "Telescope Registers"
vim.keymap.set('n', '<leader>pb', ':Telescope buffers<CR>', { silent = true }) -- "Project Buffers"
vim.keymap.set('n', '<leader>pp', ':Telescope current_buffer_fuzzy_find<CR>', { silent = true }) -- "Project Pages"
vim.keymap.set('n', '<leader>pg', ':Telescope live_grep<CR>', { silent = true }) -- "Project Grep"
vim.keymap.set('n', '<S-Up>', ':Telescope git_files<CR>', { silent = true }) -- "Git Files"

-- Uncomment and modify if needed
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end
