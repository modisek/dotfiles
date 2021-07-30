require'nvim-treesitter.configs'.setup {
ensure_installed = {
	 "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "html",
    "scss"
} ,-- one of "all", "maintained" (parsers with maintainers), or a list of languages
 ignore_install = {"yaml", "java"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"java", "yaml", "php"},
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}

--[[ local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" } ]]
