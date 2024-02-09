-- Define the function as global by removing the 'local' keyword
function get_import_path()
    local function get_git_root()
        local git_root = vim.fn.system('git -C ' .. vim.fn.expand('%:p:h') .. ' rev-parse --show-toplevel')
        if vim.v.shell_error ~= 0 then
            print("Error: Not in a Git repository.")
            return nil
        end
        return git_root:gsub('\n', '')
    end

    local git_root = get_git_root()
    if git_root == nil then
        return
    end

    local current_file_path = vim.fn.expand('%:p')
    local relative_path = vim.fn.fnamemodify(current_file_path, ':.:r')
    local import_path = relative_path:gsub(vim.pesc(git_root .. '/'), ''):gsub('/', '.')

    vim.fn.setreg('+', import_path)
    print('Import path copied to clipboard: ' .. import_path)
end

-- Define the Neovim command
vim.api.nvim_command('command! GetImportPath lua get_import_path()')

