return {
	"alvarosevilla95/luatab.nvim",
	"projekt0n/circles.nvim",
	{
		"ms-jpq/coq_nvim",
		version = "coq",
		config = function()
			vim.cmd("COQnow -s")
		end,
	},
	{ "ms-jpq/coq.artifacts", version = "artifacts" },
	{ "ms-jpq/coq.thirdparty", version = "3p" },
	"sjl/badwolf",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					undo = {
						-- telescope-undo.nvim config, see below
					},
				},
			})
			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>x", "<cmd>Telescope undo<cr>")
		end,
	},
	{
		"aktersnurra/no-clown-fiesta.nvim",
		lazy = false,
		priority = 1000,
	},
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	"folke/which-key.nvim",
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.norg.qol.todo_items"] = {},
				["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
				["core.norg.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
					},
				},
			},
		},
		dependencies = { { "nvim-lua/plenary.nvim" } },
		ft = "norg",
	},
	"lewis6991/gitsigns.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	{
		"lukas-reineke/lsp-format.nvim",
		config = {
			function()
				require("lsp-format").setup({})
			end,
		},
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{
		"folke/neodev.nvim",
		config = {
			function()
				require("neodev").setup({})
			end,
		},
	},
	"glepnir/lspsaga.nvim",
	"neovim/nvim-lspconfig",
	"mfussenegger/nvim-jdtls",
	"jose-elias-alvarez/null-ls.nvim",
	"metalelf0/base16-black-metal-scheme",
	"mfussenegger/nvim-dap",
	"nvim-lua/plenary.nvim",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "RRethy/vim-hexokinase", build = "make hexokinase" },
	"tpope/vim-surround",
	"terrortylor/nvim-comment",
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"eslint_d",
					"spell",
					"prettierd",
					"ruff",
					"ruff_lsp",
					"zigfmt",
					"erlfmt",
					"goimports",
				},
				automatic_setup = true,
				automatic_installation = true,
			})
		end,
	},
	"vlime/vlime",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"vimwiki/vimwiki",
	"MaxMEllon/vim-jsx-pretty",
	{
		"levouh/tint.nvim",
		config = {
			function()
				require("tint").setup()
			end,
		},
	},
	{
		"axelvc/template-string.nvim",
		config = {
			function()
				require("template-string").setup({
					filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
					jsx_brackets = true, -- must add brackets to jsx attributes
					remove_template_string = false, -- remove backticks when there are no template string
					restore_quotes = {
						-- quotes used when "remove_template_string" option is enabled
						normal = [[']],
						jsx = [["]],
					},
				})
			end,
		},
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/typescript.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		version = "nightly", -- optional, updated every week. (see issue #1193)
		event = { "BufReadPre", "BufNewFile" },
	},
}
