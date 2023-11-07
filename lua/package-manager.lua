local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use "olimorris/onedarkpro.nvim"

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		'ThePrimeagen/harpoon',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use "lukas-reineke/indent-blankline.nvim"
	use "nvim-treesitter/nvim-treesitter-context"

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{                   -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		}
	}

	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
