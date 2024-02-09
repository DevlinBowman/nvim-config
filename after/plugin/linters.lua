vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

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
      },
    }
  ),
}

-- Assuming nvim-lint is already installed via Packer
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

