local utils = require('utils')

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "120"
vim.opt.wrap = false
vim.opt.wrapmargin = 0

-- Set relative number
vim.opt.relativenumber = true
vim.g.mapleader = ' '

vim.opt.scrolloff = 10

-- Remaps

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>k', function()
	pcall(vim.cmd, 'm -2')
end)

vim.keymap.set('n', '<leader>j', function()
	pcall(vim.cmd, 'm +1')
end)

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- From terminal mode -> normal mode using Esc button
vim.keymap.set('t', '<ESC>', "<C-\\><C-n>")

-- Open terminal split
vim.keymap.set("n", "<leader>t", function()
	local is_nvim_tree = string.find(vim.api.nvim_buf_get_name(0), "NvimTree") ~= nil
	local split_command = utils.ternary(is_nvim_tree, "bel vsplit", "bel split")

	vim.cmd(split_command)
	vim.cmd("term")

	-- Workaround to resize nvim-tree if was the main element
	if is_nvim_tree then
		local api = require('nvim-tree.api')
		api.tree.toggle()
		api.tree.toggle()
		vim.cmd("bprevious")
	end

	vim.cmd("startinsert")
end)

-- Split the terminal horizontally and focus it
vim.keymap.set("n", "<leader>rt", function()
	vim.cmd("bel vsplit")
	vim.cmd("term")
	vim.cmd("startinsert")
end)

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
