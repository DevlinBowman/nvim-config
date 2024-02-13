require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'cssls',  'html' }, -- Add other servers as needed
    automatic_installation = true,
})
