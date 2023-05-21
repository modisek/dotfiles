local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
    "glepnir/lspsaga.nvim",
    'neovim/nvim-lspconfig',
'mfussenegger/nvim-jdtls',
 'jose-elias-alvarez/null-ls.nvim',
  'metalelf0/base16-black-metal-scheme',
  "rose-pine/neovim",
  'mfussenegger/nvim-dap',
  'nvim-lua/plenary.nvim',
  'rafamadriz/friendly-snippets',
  'nvim-treesitter/nvim-treesitter',
  {'RRethy/vim-hexokinase', build= 'make hexokinase'},
  'tpope/vim-surround',
  'terrortylor/nvim-comment',
  'B4mbus/oxocarbon-lua.nvim',
  {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
},
  'mattn/emmet-vim',
  'vlime/vlime',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'vimwiki/vimwiki',
  'MaxMEllon/vim-jsx-pretty',
  --use 'haringsrob/nvim_context_vt',
  "hrsh7th/nvim-cmp" ,
 "levouh/tint.nvim" ,
 "hrsh7th/cmp-buffer",
 "hrsh7th/cmp-nvim-lsp",
 "hrsh7th/cmp-path",
 'axelvc/template-string.nvim',
 'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
 "airblade/vim-gitgutter",
 'jose-elias-alvarez/typescript.nvim',
 { "ellisonleao/gruvbox.nvim" },
 {
  'nvim-telescope/telescope.nvim',
  dependencies = { {'nvim-lua/plenary.nvim'} }
},
 {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    version = 'nightly' -- optional, updated every week. (see issue #1193)
}



})
--- startup and add configure plugins

 

require('nvim_comment').setup()
local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({})
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
vim.g.oxocarbon_lua_alternative_telescope = true
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
vim.api.nvim_set_hl(0, 'StatusLineClock', { fg = '#ffffff', bold = true })

vim.api.nvim_set_hl(0, 'StatusLineMode', { fg = '#ffffff', bold = true })
vim.cmd("set laststatus=3")
vim.cmd("set winbar=%f")
vim.cmd("set cmdheight=0")
require("tint").setup()
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})

-- set colorscheme after options
vim.cmd('colorscheme oxocarbon-lua')
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
require('template-string').setup({
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }, -- filetypes where the plugin is active
  jsx_brackets = true, -- must add brackets to jsx attributes
  remove_template_string = false, -- remove backticks when there are no template string
  restore_quotes = {
    -- quotes used when "remove_template_string" option is enabled
    normal = [[']],
    jsx = [["]],
  },
})


