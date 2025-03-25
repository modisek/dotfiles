local fn, lsp = vim.fn, vim.lsp

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
  virtual_text = false,
  virtual_lines = true,
  underline = true,
  signs = true,
  severity_sort = false,
  update_in_insert = false,

}
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
