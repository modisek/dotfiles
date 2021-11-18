require'nvim-treesitter.configs'.setup {
ensure_installed = {
	"tsx",
    "toml",
    "php",
    "json",
    "yaml",
    "html",
    "css",
    "scss",
    "javascript",
    "lua",
    "python",
    "go",

} ,-- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"java"},
  }
}
 local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" } 
