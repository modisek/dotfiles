local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
vim.g.mapleader ="," 
-- fzf

map('n', '<leader>n', '<cmd>NERDTreeToggle<CR>')
map('n', '<leader>m', '<cmd>Files<CR>')
map('n', '<leader>g', '<cmd>Commits<CR>')
map('n', 's', '<cmd>Buffers<CR>')
g['fzf_action'] = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

map('n', '<A-d>' , ':Lspsaga open_floaterm<CR>')
map('n', '<leader>lr' , ':Lspsaga rename<CR>')
map('n', '<leader>ca' , ':Lspsaga code_action<CR>')
map('n', '<leader>gs', ':Lspsaga signature_help<CR>')
--map('n', '<leader>n' , ':NvimTreeToggle<CR>')
--map('n', '<leader>r' , ':NvimTreeFindFile<CR>')
map('n', '//', '<cmd>BLines<CR>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('i', '<right>', '<nop>')
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('n', '<right>', '<nop>')
--map('n', '<leader>ff', '<cmd>Neoformat<CR>')
--map('i', '<leader>ff', '<cmd>Neoformat<CR>')

vim.cmd("inoremap <silent><expr> <C-Space> compe#complete()")
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")
vim.cmd("nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>")
vim.cmd("vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>")
vim.cmd("nnoremap <leader>rf <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>")
-- prevent typo when pressing `wq` or `q`
vim.cmd [[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]


