-- prevent typo when pressing `wq` or `q`
vim.cmd([[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]])

vim.cmd([[

nnoremap <Leader>v :vsplit<enter>
nnoremap <Leader>s :split<enter>

" Use shift-H and shift-L for move to beginning/end
nnoremap <S-h> 0
nnoremap <S-l> $

nmap <silent> <C-N> :tabprevious<CR>
nmap <silent> <C-M> :tabnext<CR>
nmap <silent> <Leader>t :tabe %<CR>

]])

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
