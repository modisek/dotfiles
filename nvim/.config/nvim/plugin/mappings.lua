local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local keymap = vim.keymap
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

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
keymap.set('n', 'dw', 'vb"_d')

map('n', '<leader>f', '<cmd>NvimTreeToggle<CR>')
--map('n', '<leader>b', '<cmd>Files<CR>')
--map('n', '<leader>c', '<cmd>Commits<CR>')
--map('n', 's', '<cmd>Buffers<CR>')



-- map('n', '<leader>r' , ':NvimTreeFindFile<CR>')
--map('n', '//', '<cmd>BLines<CR>')
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


-- vim.cmd[[
-- nnoremap Y y$
-- ]]


vim.cmd[[
nnoremap n nzzzv
nnoremap N Nnzzzv
nnoremap J mzJ`z
]]

vim.cmd[[
    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u
    inoremap <CR> <CR><c-g>u
    ]]

    vim.cmd [[
    vnoremap J :m  '>+1<CR>gv=gv
    vnoremap K :m  '>-2<CR>gv=gv
    inoremap <C-j> <esc>:m .+1<CR>==
    inoremap <C-k> <esc>:m .-2<CR>==

    nnoremap <leader>k :m .-2<CR>==
    nnoremap <leader>j :m .+1<CR>==

    ]]

    vim.cmd [[

nnoremap <Leader>v :vsplit<enter>
nnoremap <Leader>s :split<enter>

" Use shift-H and shift-L for move to beginning/end
nnoremap <S-h> 0
nnoremap <S-l> $

nmap <silent> <C-N> :tabprevious<CR>
nmap <silent> <C-M> :tabnext<CR>
nmap <silent> <Leader>t :tabe %<CR>

]]

--TODO:find buffer lines thingy

keymap.set('n', '<leader>n', "<cmd> lua require('telescope.builtin').find_files()<CR>")
vim.api.nvim_set_keymap('n', '<leader>m',
    "<cmd>lua require('telescope.builtin').diagnostics()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>/',
    "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pp',
    "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>",
    { noremap = true, silent = true })


