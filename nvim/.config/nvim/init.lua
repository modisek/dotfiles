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
  use 'jiangmiao/auto-pairs'
  use 'vimwiki/vimwiki'
  use 'tacsiazuma/easyjava.vim'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'mhartington/oceanic-next' 
  use {
  'abecodes/tabout.nvim',
  config = function()
    require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    enable_backwards = true, -- well ...
     completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}
  end,
	wants = {'nvim-treesitter'}, -- or require if not used so far
	after = {'nvim-compe'} -- if a completion plugin is using tabs load it before
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
