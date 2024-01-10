-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

----------------------------------------------------------
--FILE SEARCH & MANAGEMENT--

  -- uses telescope to search for files

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


----------------------------------------------------------
--VISUAL--

  -- set oxocarbon as the color scheme
  use {
    'nyoom-engineering/oxocarbon.nvim', as = 'oxocarbon', config=function() vim.cmd('colorscheme oxocarbon') end
  }

  -- set better statusline
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

----------------------------------------------------------
--INPUT UTILITIES--

  -- use autocomment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

  use ('mbbill/undotree')
  use ('terryma/vim-multiple-cursors')
  use ('tpope/vim-surround') 

---------------------------------------------------------
-- CODING UTILITIES--
 
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('tpope/vim-fugitive')
  use ('nvim-lua/plenary.nvim')
  use ('thePrimeagen/Harpoon')

  use ('mfussenegger/nvim-dap')
  use {
       'mattn/emmet-vim',
       config = function()
       vim.g.user_emmet_leader_key=','
       vim.g.user_emmet_mode='n'
    end
}
  
---------------------------------------------------------
--LSP--

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}

  -- use {'jose-elias-alvar ez/null-ls.nvim', requires = {'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig'}}

----------------------------------------------------------
  -- use 'preservim/nerdtree'  
----------------------------------------------------------
-- use bots
-- use({
--   "jackMort/ChatGPT.nvim",
--     config = function()
--       require("chatgpt").setup({
--         api_key_cmd = "gpg --decrypt /Users/ven/.config/nvim/lua/ven/secrets.txt.gpg 2>/dev/null"
--       })
--     end,
--     requires = {
--       "MunifTanjim/nui.nvim",
--       "nvim-lua/plenary.nvim",
--       "nvim-telescope/telescope.nvim"
--     }
-- })


-- remap for tab complete with Copilot
  use ('github/copilot.vim')

end)

