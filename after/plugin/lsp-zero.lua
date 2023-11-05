local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'tailwindcss'
})

lsp.setup_servers({ 'tsserver', 'eslint', 'lua_ls', 'tailwindcss' })

lsp.set_sign_icons({
	error = "X",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

lsp.setup()

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)
