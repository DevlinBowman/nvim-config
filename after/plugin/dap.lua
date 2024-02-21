local dap = require('dap')
  dap.adapters.python = {
    type = 'executable';
    command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
    args = { '-m', 'debugpy.adapter' };
  }
--
--
--   -- View the current scopes in a sidebar:
--
--   local widgets = require('dap.ui.widgets')
--   local my_sidebar = widgets.sidebar(widgets.scopes)
--   my_sidebar.open()
--
-- -- View the current frames in a sidebar:
--
--   local widgets = require('dap.ui.widgets')
--   local my_sidebar = widgets.sidebar(widgets.frames)
--   my_sidebar.open()
--
-- -- View the current scopes in a centered floating window:
--
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
--
-- -- View the value for the expression under the cursor in a floating window:
--
--   require('dap.ui.widgets').hover()
