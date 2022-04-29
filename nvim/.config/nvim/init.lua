local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  git = {
      clone_timeout = 300,
  }
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  use {'neovim/nvim-lspconfig',
    requires ={
        --'onsails/lspkind-nvim',
       -- 'mfussenegger/nvim-jdtls'
    }
  }
  use 'rafamadriz/friendly-snippets'

  use 'nvim-treesitter/nvim-treesitter'
  use {'RRethy/vim-hexokinase', run= 'make hexokinase'}
  use 'tpope/vim-surround'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  use 'ibhagwan/fzf-lua'

 -- use 'mattn/emmet-vim'
  use 'vlime/vlime'
  use 'windwp/nvim-autopairs'
  use 'vimwiki/vimwiki'
  --use 'tacsiazuma/easyjava.vim'
  use 'MaxMEllon/vim-jsx-pretty'
  --use {'styled-components/vim-styled-components',branch = 'main' }
  use 'haringsrob/nvim_context_vt'
 -- use 'hrsh7th/vim-vsnip'
 -- use 'kitagry/vs-snippets' 
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use 'saadparwaiz1/cmp_luasnip'
  use {
      "L3MON4D3/LuaSnip",
      after = 'nvim-cmp',
}
  use "airblade/vim-gitgutter"
  --use { "ellisonleao/gruvbox.nvim" }

   end )
   vim.g["netrw_keepdir"] = 0
    vim.g["netrw_winsize"] = 30
   vim.g["netrw_banner"] = 0
    vim.g["netrw_liststyle"] = 3
--vim.g["netrw_browse_split"] = 1



