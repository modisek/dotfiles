local api = vim.api
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

cmd("set re=0")
cmd("set noshowmode")
cmd("set noruler")
cmd("set laststatus=0")
cmd("set noshowcmd")
cmd("set cmdheight=1")
-- global options
o.clipboard = "unnamedplus"
cmd 'filetype plugin indent on'
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 10
o.swapfile = false
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.timeoutlen = 3000
o.ttimeoutlen = 100
cmd("set undodir=~/.nvim/undodir")
o.cursorline = false
o.foldenable = false
o.conceallevel = 2
o.mouse = 'a'
o.wildmenu = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.showmode = true
o.listchars='tab:│ ,nbsp:␣,trail:·,extends:>,precedes:<'
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
api.nvim_command('set completeopt=menuone,noinsert,noselect')
--" Use <Tab> and <S-Tab> to navigate through popup menu
api.nvim_command('inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"')
api.nvim_command('inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"')
--" Avoid showing message extra message when using completion
api.nvim_command('set shortmess+=c')
-- i couldn't figure out how to set the colorscheme in lua
cmd('syntax on')
o.background = 'dark'
g.pumheight = 10
cmd('set termguicolors')
-- window-local options
wo.number = true
wo.list = true
wo.wrap = true
wo.relativenumber = true
-- buffer-local options
--
bo.expandtab = true



cmd('au BufNewFile,BufRead * if &ft == "" | set ft=text | endif')

cmd('au FocusLost * :wa')

cmd [[
   if exists('$TMUX')

    " Colors in tmux

    let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"

    let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"

    endif

]]

local fn, cmd = vim.fn, vim.cmd

function my_statusline()
  local branch = fn.FugitiveHead()

  if branch and #branch > 0 then
    branch = '  '..branch
  end

  return branch..' %f%m%=%l:%c'
end

cmd[[ set statusline=%!luaeval('my_statusline()') ]] 






