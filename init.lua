require("ven")

-- opens help in vertical split
vim.cmd([[command! -nargs=1 -complete=help H vertical help <args>]])
vim.cmd([[command! -nargs=1 -complete=help Help vertical help <args>]])

  -- local dap = require('dap')
  -- dap.adapters.python = {
  --   type = 'executable';
  --   command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
  --   args = { '-m', 'debugpy.adapter' };
  -- }
