vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "text"},
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.cmd("NERDTreeClose")
    end
})

