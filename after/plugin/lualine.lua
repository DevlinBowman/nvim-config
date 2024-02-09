local function git_relative_path()
    local file_path = vim.fn.expand('%:p')

    local handle = io.popen('git rev-parse --show-toplevel 2> /dev/null')
    local git_root = handle:read('*a'):gsub('\n$', '')
    handle:close()

    if git_root and #git_root > 0 and file_path:sub(1, #git_root) == git_root then
        local relative_path = file_path:sub(#git_root + 2)
        return relative_path
    else
        return ''
    end
end



require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {git_relative_path},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'location'},
    lualine_z = {'mode'}
  },
  inactive_sections = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
