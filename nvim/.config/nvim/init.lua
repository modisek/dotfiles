require('defaults')
require('compconf')
require('mappings')
require('lspconf')
require('plugins')
require('lspSaga')
require('tsconf')

vim.cmd 'colorscheme luba'
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- change cwd to current directory
vim.cmd [[cd %:p:h]]
vim.g.vimwiki_list = {
            {
                path = '~/notes',
                syntax = 'markdown',
                ext = '.md',
                path_html = '~/notes/site_html/',
                custom_wiki2html = 'vimwiki_markdown'

            }
        }
 vim.g.user_emmet_settings = {
        javascript = {
            extends = 'jsx'
         }
}



vim.cmd[[autocmd FileType html,css,javascript.jsx,javascript EmmetInstall]]

require 'colorizer'.setup({
  'css';
  'javascript';
  html = { mode = 'background' };
}, { mode = ' vrtualtext' })
