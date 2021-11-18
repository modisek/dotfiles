local config = {
  -- The command that starts the language server
  cmd = {
    '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.level=ALL ',
	'-noverify ',
	'-Xmx1G ',
	'-jar ~/dev/plugins/org.eclipse.equinox.launcher_1.6.400.v20210908-1257.jar ',
	'-configuration ~/dev/config_linux/',
	'-data ~/dev/workspace',
	'--add-modules=ALL-SYSTEM ',
	'--add-opens java.base/java.util=ALL-UNNAMED ',
	'--add-opens java.base/java.lang=ALL-UNNAMED'
      },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
}

vim.api.nvim_exec([[
			augroup jdtls
			au!
			au FileType java lua require('jdtls').start_or_attach({cmd = {'st_j'}})
            augroup end]],false)

