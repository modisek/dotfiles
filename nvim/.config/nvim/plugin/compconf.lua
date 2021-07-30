require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 2;
  preselect = 'enable ';
  throttle_time = 80;   
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
vim.g.loaded_compe_snippets_nvim=0
vim.g.loaded_compe_treesitter=0
vim.g.loaded_compe_spell=0
--let g:loaded_compe_path=0
vim.g.loaded_compe_nvim_lua=0
vim.g.loaded_compe_calc=0
vim.g.loaded_compe_tags=0
vim.g.loaded_compe_emoji=0
