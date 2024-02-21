-- Instanciate lsp-zero
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

local lspconfig = require('lspconfig')

-- CSS LSP
lspconfig.cssls.setup{}

-- HTML LSP
lspconfig.html.setup{}

-- Deno LSP
-- lspconfig.denols.setup{}

require('lspconfig').tsserver.setup{
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "html" }  -- Ensure HTML is included
}

-- Configure pylsp
lspconfig.pylsp.setup{
    -- Specify the command if it's not in the default path
    -- cmd = {"/path/to/pylsp"},

    -- Configuration settings for pylsp
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {'E501'},  -- Ignore E501 errors
                    maxLineLength = 120 -- You can set your preferred max line length (optional)
                }
            }
        }
    },
}


--
-- Diagnostic configuration
--

local lint = require('lint')
lint.linters.mypy = {
  cmd = 'mypy',
  stdin = false,
  args = {'--show-column-numbers'},
  stream = 'stdout',

  ignore_exitcode = true,
  parser = require('lint.parser').from_pattern(
    [[:(%d+):(%d+): (%w+): (.+)]],
    { 'row', 'col', 'severity', 'message' },
    {
      severities = {
        error = vim.diagnostic.severity.ERROR,
        warning = vim.diagnostic.severity.WARN,
        note = vim.diagnostic.severity.INFO,
      },
    }
  ),
}

require('lint').linters_by_ft = {
  python = {'mypy'},  -- Use mypy for Python files
  lua = {'luacheck'},  -- Use luacheck for Lua files
}

vim.api.nvim_create_autocmd({"BufWritePost", "TextChanged"}, {
  pattern = {"*.py", "*.lua"},
  callback = function()
    require('lint').try_lint()
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '■',  -- This can be any character you prefer
    spacing = 0,
  },
  signs = true,
  underline = true,
  update_in_insert = true,  -- Set to true if you want diagnostics while typing
  severity_sort = true,
})

-- Command to toggle diagnostics
vim.api.nvim_create_user_command('ToggleDiagnostics', function()
    local current_state = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not current_state })
end, {})

-- Automatically run the command when Vim starts
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("ToggleDiagnostics")
    end,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
