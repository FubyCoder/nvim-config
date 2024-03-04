local lsp = require('lsp-zero')
local lsp_config = require("lspconfig")

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

lsp_config.lua_ls.setup(lsp.nvim_lua_ls())

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)


if not vim.g.vscode then
	lsp.setup()
end
