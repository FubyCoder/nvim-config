vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true


require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	disable_netrw = true,
	view = {
		width = 40,
	},
	renderer = {
		root_folder_label = false,

		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
			git_placement = "before",
		},
	},

	git = {
		ignore = false
	},

	filters = {
		dotfiles = false,
		custom = { ".git$" }
	},
})

local api = require('nvim-tree.api')

vim.keymap.set('n', '<C-b>', api.tree.toggle, {})
