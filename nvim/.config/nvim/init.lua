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

  -- add you plugins here like

  use {'neovim/nvim-lspconfig',
    requires ={
        'onsails/lspkind-nvim',
        'mfussenegger/nvim-jdtls'
    }
  }
  use 'rafamadriz/friendly-snippets'
-- use {
--   "folke/twilight.nvim",
--   config = function()
--     require("twilight").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   end
-- }
  use 'nvim-treesitter/nvim-treesitter'
  use {'RRethy/vim-hexokinase', run= 'make hexokinase'}
  use 'tpope/vim-fugitive' 
  use 'tpope/vim-surround'
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
-- use {
--   "folke/zen-mode.nvim",
--   config = function()
--     require("zen-mode").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--        {
--            twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
--     gitsigns = { enabled = false }, -- disables git signs
--     tmux = { enabled = false },
--        }
--     }
--   end
-- }
 -- use 'mattn/emmet-vim'
  use 'vlime/vlime'
  use 'windwp/nvim-autopairs'
  use 'vimwiki/vimwiki'
  --use 'tacsiazuma/easyjava.vim'
  --use 'MaxMEllon/vim-jsx-pretty'
  --use {'styled-components/vim-styled-components',branch = 'main' }
  use 'haringsrob/nvim_context_vt'
  use 'hrsh7th/vim-vsnip'
  use 'kitagry/vs-snippets' 
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"

  use "airblade/vim-gitgutter"
-- use 'jose-elias-alvarez/null-ls.nvim'
-- use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'nvim-lua/plenary.nvim'
  use 'ray-x/go.nvim'
--use 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
  use {"ellisonleao/glow.nvim"}

  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  end
)


vim.cmd[[set termguicolors]]
vim.cmd 'colorscheme luba'
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- change cwd to current directory
vim.cmd [[cd %:p:h]]
vim.g.vimwiki_list = {
            {
                path = '~/notes',
                syntax = 'markdown',
                ext = '.md',
                path_html = '~/notes/site_html/',
                custom_wiki2html = 'vimwiki_markdown'

            }
        }
 vim.g.user_emmet_settings = {
        javascript = {
            extends = 'jsx'
         }
}
