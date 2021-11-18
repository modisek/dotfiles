local nvim_lsp = require('lspconfig')
local api = vim.api
local cwd = vim.loop.cwd

require('modules/handlers')

local mapper = function(mode, key, result)
  api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.documentationFormat = {
  "markdown",
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport =
  true
capabilities.textDocument.completion.completionItem.tagSupport = {
  valueSet = { 1 },
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local lsp_on_attach = function(client)

     if client.resolved_capabilities.code_lens then
    vim.cmd [[
    augroup CodeLens
      au!
      au InsertEnter,InsertLeave * lua vim.lsp.codelens.refresh()
    augroup END
    ]]
  end

  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    ]]
end
 if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

  require("modules/mappings").mappings()
end

local lsp_on_init = function(client)
vim.notify(client.name .. ": Language Server Client successfully started!", "info")
end


vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
--vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

local servers = {
    sqls ={},
      tsserver = {
    init_options = vim.tbl_extend(
      "force",
      require("nvim-lsp-ts-utils").init_options,
      { documentFormatting = false }
    ),
  },
    -- tsserver ={
    -- cmd = { "typescript-language-server", "--stdio" },
    -- filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    -- init_options = {
    --   hostInfo = "neovim"
    -- },
    -- -- root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
    -- },
    terraformls={
            cmd = { "terraform-ls", "serve" },
            filetypes = { "terraform" }
    },

    svelte={
        cmd = { "svelteserver", "--stdio" },
    filetypes = { "svelte" },
    --root_dir = root_pattern("package.json", ".git")
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
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
         codelenses = {
          generate = true, -- show the `go generate` lens.
          gc_details = true, --  // Show a code lens toggling the display of gc's choices.
          test = true,
          tidy = true
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        matcher = "fuzzy",
        diagnosticsDelay = "500ms",
        experimentalWatchedFileDelay = "1000ms",
        symbolMatcher = "fuzzy",
        gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
        buildFlags = {"-tags", "integration"}
        -- buildFlags = {"-tags", "functional"}
      },
        staticcheck = true,
      },
      flags = {allow_incremental_sync = true, debounce_text_changes = 150},
    },
          html = {
        cmd = { "vscode-html-language-server", "--stdio" },
      },
  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
      },


}

for name, opts in pairs(servers) do
  if type(opts) == "function" then
    opts()
  else
    local client = nvim_lsp[name]
    client.setup(vim.tbl_extend("force", {
      flags = { debounce_text_changes = 150 },
      on_attach = lsp_on_attach,
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
