require'nvim-treesitter.configs'.setup {
ensure_installed = {
    "toml",
    "json",
    "yaml",
    "html",
    "css",
    "scss",
    "javascript",
    "lua",
    "python",
    "go",
    "markdown"

} ,-- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"java", "python"},
  }
}
 local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" } 
