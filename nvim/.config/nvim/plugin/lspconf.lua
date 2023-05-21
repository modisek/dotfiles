
local fn, lsp = vim.fn, vim.lsp
require("mason").setup()
require("mason-lspconfig").setup{ensure_installed = { "bashls", "gopls", "tsserver", "denols", "tailwindcss", "svelte", "html", "cssls", "pyright" }}
local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
  -- border = Util.borders,
  border = Border,
})

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
  lsp.handlers.signature_help,
  {
    border = Border,
  }
)
local signs = {
  Error = "E ",
  Warn = "W ",
  Hint = "H ",
  Info = "I ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = "",
  })
end

vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  signs = true,
  severity_sort = false,
  update_in_insert = false,

}

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>gv', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local lsp_on_init = function(client)
vim.notify(client.name .. ": Language Server Client successfully started!", "info")
end


vim.cmd [[ autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd[[ autocmd BufWritePre *.go lua goimports(1000)]]
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]]
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.formatting()]]

local servers = {
    tsserver = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    init_options =

{
  hostInfo = "neovim"
}
    },
      denols = {
          cmd = { "deno", "lsp" },
          filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
          root_dir = nvim_lsp.util.root_pattern('deno.json'),
         init_options = {
   enable = true,
    unstable = false
  },
  },
    pyright={},
        terraformls={
            cmd = { "terraform-ls", "serve" },
            filetypes = { "terraform" }
    },

    svelte={
        cmd = { "svelteserver", "--stdio" },
    filetypes = { "svelte" },
    --root_dir = root_pattern("package.json", ".git")
    },
    tailwindcss={
        cmd = { "tailwindcss-language-server", "--stdio" },
        filetypes ={ "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
        init_options ={
             userLanguages = {
    eelixir = "html-eex",
    eruby = "erb"
  }
        },
        settings = {
  tailwindCSS = {
    classAttributes = { "class", "className", "classList", "ngClass" },
    lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidConfigPath = "error",
      invalidScreen = "error",
      invalidTailwindDirective = "error",
      invalidVariant = "error",
      recommendedVariantOrder = "warning"
    },
    validate = true
  }
}
    },
   bashls ={
       cmd = { "bash-language-server", "start" },
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
    },
    filetypes = { "sh" }
   },
   gopls = {
        cmd = {"gopls", "serve"},
        capabilities = capabilities,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
         codelenses = {
          generate = false, -- show the `go generate` lens.
          gc_details = false, --  // Show a code lens toggling the display of gc's choices.
          test = true,
          tidy = true
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
       -- matcher = "fuzzy",
        --diagnosticsDelay = "500ms",
        --experimentalWatchedFileDelay = "1000ms",
        --symbolMatcher = "fuzzy",
        gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
        buildFlags = {"-tags", "integration"}
        -- buildFlags = {"-tags", "functional"}
      },
      },
      flags = {allow_incremental_sync = true, debounce_text_changes = 150},
    },
    html = {
        cmd = { "vscode-html-language-server", "--stdio" },
      },
    cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
      },
    markdown = {
    cmd = { "vscode-markdown-language-server", "--stdio" },
      },
json= {
    cmd = { "vscode-json-language-server", "--stdio" },
      },
eslint = {
    cmd = { "vscode-eslint-language-server", "--stdio" },
      },



        }




for name, opts in pairs(servers) do
  if type(opts) == "function" then
    opts()
  else
    local client = nvim_lsp[name]
    client.setup(vim.tbl_extend("force", {
      flags = { debounce_text_changes = 150 },
      on_attach = on_attach,
      on_init = lsp_on_init,
      capabilities = capabilities,
    }, opts))
  end
end

local Border = {
{"╭", "FloatBorder"},
{"─", "FloatBorder"},
{"╮", "FloatBorder"},
{"│", "FloatBorder"},
{"╯", "FloatBorder"},
{"─", "FloatBorder"},
{"╰", "FloatBorder"},
{"│", "FloatBorder"},

}


-- vim.api.nvim_command("autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({border="..vim.inspect(Border)..", focusable=false})")

  function goimports(timeout_ms)
    local context = { only = { "source.organizeImports" } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end

vim.cmd[[autocmd BufWritePre *.go lua goimports(1000)]]
