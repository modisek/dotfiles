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
        'glepnir/lspsaga.nvim',
        'onsails/lspkind-nvim',
        'mfussenegger/nvim-jdtls'

    }
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {'junegunn/fzf',
        requires = {
            'junegunn/fzf.vim'

        }
  }
    use {'RRethy/vim-hexokinase', run= 'make hexokinase'}
  use 'tpope/vim-fugitive' 
  use {'b3nj5m1n/kommentary',
    event="InsertEnter"
  }
  use 'mattn/emmet-vim'
  use 'vlime/vlime'
  use { 'windwp/nvim-autopairs',
    event="InsertEnter"
  }
  use {'vimwiki/vimwiki',
    cmd = {
        "VimwikiIndex"
    }
  }
  use 'tacsiazuma/easyjava.vim'
  use 'MaxMEllon/vim-jsx-pretty'
  use {'styled-components/vim-styled-components',branch = 'main' }
  use 'haringsrob/nvim_context_vt'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
}

 use 'hrsh7th/vim-vsnip'
use 'kitagry/vs-snippets' 
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"

use "airblade/vim-gitgutter"
use "preservim/nerdtree"
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


