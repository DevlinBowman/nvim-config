-- Set up word wrapping
vim.o.wrap = true
vim.o.textwidth = 80
vim.o.formatoptions = vim.o.formatoptions .. "t"

-- Auto-format text when you write
vim.o.formatoptions = vim.o.formatoptions .. "a"

-- Display line numbers
vim.wo.number = true

-- Cursor movement over wrapped lines
vim.o.whichwrap = vim.o.whichwrap .. "<,>,[,]"

-- Turn on spell check
vim.o.spell = true

-- Automatic line breaking at appropriate places
vim.o.linebreak = true

-- Soft tab settings
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Enable mouse support
vim.o.mouse = "a"

-- Set colorscheme if desired
vim.cmd([[ colorscheme desert ]])  -- Replace 'desert' with your preferred colorscheme


