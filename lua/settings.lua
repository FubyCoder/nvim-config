-- <leader> key setup
vim.g.mapleader = ' '

-- Indentation setup for 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Line for code length over 120 chars
vim.opt.colorcolumn = "120"

-- Disable text wrap (why this thing exists ?)
vim.opt.wrap = false
vim.opt.wrapmargin = 0

-- Relative line number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Minimum lines displayed above and below cursor
vim.opt.scrolloff = 10

-- Highlight current line
vim.opt.cursorline = true

-- Highlight text on yank (copy)
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
	end,
})

-- Format code on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup('format_on_save', {}),
	desc = "Format on save",
	pattern = '*',
	callback = function()
		vim.lsp.buf.format()
	end,
})
