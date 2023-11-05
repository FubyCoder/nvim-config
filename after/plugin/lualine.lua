require("lualine").setup({
	options = {
		theme = 'onedark',
		icons_enabled = true,
		globalstatus = true,
		ignore_focus = { 'packer', 'NvimTree' }
	}
})

-- Remove the line -- INSERT -- etc
vim.cmd "set noshowmode"
