-- Remaps
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>k', function()
	vim.cmd('m -2')
end)

vim.keymap.set('n', '<leader>j', function()
	vim.cmd('m +1')
end)

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Custom Configs
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
	end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup('format_on_save', {}),
	desc = "Format on save",
	pattern = '*',
	callback = function()
		vim.lsp.buf.format()
	end,
})
