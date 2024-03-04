if not vim.g.vscode then
	require('nvim-treesitter.configs').setup {
		ensure_installed = { "lua", "vim", "vimdoc", "query", 'typescript', 'javascript', 'tsx', "python" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
end
