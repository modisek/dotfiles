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
  use 'nvim-treesitter/nvim-treesitter'
  use {'RRethy/vim-hexokinase', run= 'make hexokinase'}
  use 'tpope/vim-fugitive' 
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  use 'mattn/emmet-vim'
  use 'vlime/vlime'
  use 'windwp/nvim-autopairs'
  use 'vimwiki/vimwiki'
  use 'tacsiazuma/easyjava.vim'
  use 'MaxMEllon/vim-jsx-pretty'
  use {'styled-components/vim-styled-components',branch = 'main' }
  use 'haringsrob/nvim_context_vt'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'
use 'kitagry/vs-snippets' 
use "hrsh7th/nvim-cmp"
use "hrsh7th/cmp-buffer"
use "hrsh7th/cmp-nvim-lsp"
use "hrsh7th/cmp-path"
use "rafamadriz/friendly-snippets"
use "airblade/vim-gitgutter"
use 'jose-elias-alvarez/null-ls.nvim'
use 'jose-elias-alvarez/nvim-lsp-ts-utils'
use 'nvim-lua/plenary.nvim'
use 'ray-x/go.nvim'
use 'https://gitlab.com/yorickpeterse/nvim-pqf.git'
use {"ellisonleao/glow.nvim"}
use 'sheerun/vim-polyglot'
use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
}
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


vim.cmd[[autocmd FileType html,css,javascript.jsx,javascript EmmetInstall]]
require("null-ls").config {
    sources = {

        require("null-ls").builtins.formatting.eslint_d,
        require("null-ls").builtins.formatting.markdownlint,
        require("null-ls").builtins.formatting.terraform_fmt,
        require("null-ls").builtins.formatting.trim_newlines,

    }
}
require("lspconfig")["null-ls"].setup{}
require("modules/null-ls").setup()
--vim.cmd[[autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]]
require('pqf').setup({
  signs = {
    error = 'E',
    warning = 'W',
    info = 'I',
    hint = 'H'
  }
})
