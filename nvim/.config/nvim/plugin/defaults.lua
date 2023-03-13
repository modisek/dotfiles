local api = vim.api
local o = vim.opt
local g = vim.g
local cmd = vim.cmd

cmd("set pumblend=5")
--cmd("set updatetime=100")
-- global options
o.clipboard = "unnamedplus"
cmd("filetype plugin indent on")
o.foldmethod = "manual"
o.foldopen = { "percent", "search" }
o.swapfile = false
o.dir = "/tmp"
o.smartcase = true
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 6
o.timeoutlen = 3000
o.ttimeoutlen = 100
cmd("set undodir=~/.nvim/undodir")
o.cursorline = false
o.foldenable = false
o.conceallevel = 2
o.mouse = "nv"
o.wildmenu = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.showmode = true
o.listchars = "tab:│ ,nbsp:␣,trail:·,extends:>,precedes:<"
o.hidden = true
cmd("set undofile")
o.backup = false
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
]]
--" Set completeopt to have a better completion experience
api.nvim_command("set completeopt=menuone,noinsert,noselect")
--" Use <Tab> and <S-Tab> to navigate through popup menu
api.nvim_command('inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"')
api.nvim_command('inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"')
--" Avoid showing message extra message when using completion
api.nvim_command("set shortmess+=c")
cmd("syntax on")
o.background = "dark"
g.pumheight = 10
cmd("set termguicolors")
-- window-local options
o.number = true
o.list = true
o.wrap = true
o.relativenumber = true
-- buffer-local options
--
o.expandtab = true

cmd('au BufNewFile,BufRead * if &ft == "" | set ft=text | endif')

cmd("au FocusLost * :wa")
local fn, cmd = vim.fn, vim.cmd

local disabled_built_ins = {
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

o.lazyredraw = true

vim.cmd([[set termguicolors]])
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")

-- change cwd to current directory
vim.cmd([[cd %:p:h]])
vim.g.vimwiki_list = {
	{
		path = "~/notes",
		syntax = "markdown",
		ext = ".md",
		path_html = "~/notes/site_html/",
		custom_wiki2html = "vimwiki_markdown",
	},
}

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
