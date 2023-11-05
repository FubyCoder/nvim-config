local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'tailwindcss'
})

lsp.setup()
lsp.setup_servers({'tsserver','eslint', 'lua_ls','tailwindcss'})

lsp.set_sign_icons({
  error = "X",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

