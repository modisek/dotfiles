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
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  
  -- add you plugins here like
  
  use 'neovim/nvim-lspconfig'
  use  'hrsh7th/nvim-compe'
  use 'nvim-treesitter/nvim-treesitter'
  use 'mfussenegger/nvim-jdtls'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'preservim/nerdtree'
  use {'RRethy/vim-hexokinase', run= 'make hexokinase'}
  use 'tpope/vim-fugitive' 
  use 'b3nj5m1n/kommentary'
  use 'mattn/emmet-vim'
  use 'vlime/vlime'
  
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
