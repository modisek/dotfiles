vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged


return require('packer').startup(function()
  -- Packer can manage itself:w
  
  use 'wbthomason/packer.nvim'
  
  end)

