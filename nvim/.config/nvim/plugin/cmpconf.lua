 local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
  documentation = {
    border = "solid",
  },
   mapping = {
    ["<S-TAB>"]   = cmp.mapping.select_prev_item(),
    ["<TAB>"]     = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"]     = cmp.mapping.close(),
    ["<CR>"]      = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
    sources = {
      { name = 'buffer' },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'vsnip'},
      
    }
  })

  local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end
  }
}
