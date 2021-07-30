local nvim_lsp = require('lspconfig')
local api = vim.api
local cwd = vim.loop.cwd

local mapper = function(mode, key, result)
  api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local custom_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

local mappings = function()
          -- Move cursor to the next and previous diagnostic
  mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
  -- Keybindings for LSPs
  -- Close quickfix with :cclose:
  mapper('n', 'gd', 'vim.lsp.buf.definition()')
  mapper('n', 'gh', 'vim.lsp.buf.hover()')
  mapper('n', 'gD', 'vim.lsp.buf.implementation()')
  mapper('n', '<c-k>', 'vim.lsp.buf.signature_help()')
  mapper('n', '1gD', 'vim.lsp.buf.type_definition()')
  mapper('n', 'gr', 'vim.lsp.buf.references()')
  mapper('n', 'g0', 'vim.lsp.buf.document_symbol()')
  mapper('n', 'gW', 'vim.lsp.buf.workspace_symbol()')
  mapper('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
 if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>f", "vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<leader>f", "vim.lsp.buf.range_formatting()<CR>", opts)
  end

 if client.resolved_capabilities.code_lens then
        vim.cmd [[
          augroup CodeLens
            au!
            au CursorHold,CursorHoldI * lua vim.lsp.codelens.refresh()
          augroup END
        ]]
      end
end
local custom_on_attach = function(client) 
         if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

end

local custom_on_init = function()
  print("Language Server Protocol started!")
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false ,--{
    --  prefix = "»",
    --  spacing = 4,
   -- },
    signs = true,
    update_in_insert = false,
    underline = true
  }
)
vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

vim.fn.sign_define('LspDiagnosticsSignError', { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsDefaultHint" })
local sumneko_root = os.getenv("HOME") .. "/repos/lua-language-server"
local servers = {
        phpactor ={
                filetypes = {"php"}
        },
    denols = {
filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = vim.loop.cwd,
  settings = {
    documentFormatting = true,
    lint = true,
    unstable = true
  

    }
  },
  jdtls = {
	  extra_setup = function()
		vim.api.nvim_exec([[
			augroup jdtls
			au!
			au FileType java lua require('jdtls').start_or_attach({cmd = {'start_jdtls'},on_attach = mappings})
  augroup end]],false)
  end
  },
  html = {
        cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" ,"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      configurationSection = { "html", "css", "javascript"},
      embeddedLanguages = {
        css = true,
        javascript = true
      }
    },   
    settings = {}
  },
  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    settings = {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }
  },

  sumneko_lua = {
    cmd = {
      sumneko_root .. "/bin/Linux/lua-language-server",
      "-E",
      sumneko_root .. "/main.lua",
    },
    on_attach = custom_on_attach,
    on_init = custom_on_init,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
        diagnostics = {
          enable = true,
          globals = {
            "vim",
            "describe",
            "it",
            "before_each",
            "after_each",
            "awesome",
            "theme",
            "client",
            "P",
          },
        },
        workspace = {
          preloadFileSize = 400,
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  local client = nvim_lsp[name]
  if opts.extra_setup then
    opts.extra_setup()
  end
  client.setup({
    cmd = opts.cmd or client.cmd,
    filetypes = opts.filetypes or client.filetypes,
    on_attach = opts.on_attach or custom_on_attach,
    on_init = opts.on_init or custom_on_init,
    handlers = opts.handlers or client.handlers,
    root_dir = opts.root_dir or client.root_dir,
    capabilities = opts.capabilities or custom_capabilities(),
    settings = opts.settings or {},
  })
end

