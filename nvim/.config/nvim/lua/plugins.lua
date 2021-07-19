vim.cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq
paq {'savq/paq-nvim', opt=true}
-- LSP, Snippets, autocompletion, treesitter
paq 'neovim/nvim-lspconfig'
paq 'hrsh7th/nvim-compe'
paq 'nvim-treesitter/nvim-treesitter'
paq 'dsznajder/vscode-es7-javascript-react-snippets'

paq 'hrsh7th/vim-vsnip'
paq 'hrsh7th/vim-vsnip-integ'
paq 'rafamadriz/friendly-snippets'
paq 'tacsiazuma/easyjava.vim'
paq 'mfussenegger/nvim-jdtls'
--paq 'onsails/lspkind-nvim'
-- finding  stuff
-- utils
paq 'haya14busa/is.vim'
paq 'psliwka/vim-smoothie'
paq 'vimwiki/vimwiki'
paq 'tpope/vim-fugitive'

-- eye candy
paq 'rktjmp/lush.nvim'
paq 'npxbr/gruvbox.nvim'
paq 'p00f/nvim-ts-rainbow'
paq 'owozsh/amora'
-- language stuff
paq 'Dinduks/vim-java-get-set'
--paq 'nvim-telescope/telescope.nvim'
--paq 'yamatsum/nvim-nonicons'
paq 'glepnir/lspsaga.nvim'
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'b3nj5m1n/kommentary'
paq 'haringsrob/nvim_context_vt'
paq 'vlime/vlime'
paq 'junegunn/fzf'
paq 'junegunn/fzf.vim'
paq 'preservim/nerdtree'
paq 'ryanoasis/vim-devicons'
paq 'mattn/emmet-vim'
--paq 'RRethy/vim-hexokinase'

--vim.g.Hexokinase_highlighters = 'virtual'
--paq 'norcalli/nvim-colorizer.lua'
paq 'DarwinSenior/nvim-colorizer.lua'

