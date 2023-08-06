-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


----------------------------------------------------------

-- TEXT FORMATTING

  -- use ('folke/zen-mode.nvim')
  use ('junegunn/goyo.vim')
  use ('junegunn/limelight.vim')
  use ('preservim/vim-pencil')
  use ('rhysd/vim-grammarous')
  use ('preservim/vim-wordy')

----------------------------------------------------------
end)
