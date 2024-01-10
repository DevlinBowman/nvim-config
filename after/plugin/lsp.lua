local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

local lspconfig = require'lspconfig'

lspconfig.pylsp.setup{
    cmd = {"/path/to/your/pylsp", "-vv", "--log-file", "/tmp/pylsp.log"},
}


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
