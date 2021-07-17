--require('compconf')
require('defaults')
require('mappings')
require('lspconf')
require('plugins')
require('lspSaga')
require('tsconf')

vim.cmd 'colorscheme gruvbox'
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- change cwd to current directory
vim.cmd [[cd %:p:h]]
vim.g.vimwiki_list = {
            {
                path = '~/vimwiki',
                syntax = 'markdown',
                ext = '.md',
                path_html = '~/vimwiki/site_html/',
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
