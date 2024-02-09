local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

local lspconfig = require'lspconfig'

lspconfig.pylsp.setup{
    cmd = {"/usr/local/bin/pylsp", "-vv", "--log-file", "/tmp/pylsp.log"},
}

vim.diagnostic.config({
  virtual_text = {
    prefix = '■',  -- This can be any character you prefer
    spacing = 0,
  },
  signs = true,
  underline = true,
  update_in_insert = false,  -- Set to true if you want diagnostics while typing
  severity_sort = true,
})


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
