local utils = require('utils')

local exit_to_normal_mode = "<C-\\><C-n>"

local move_block_down = ":m '>+1<CR>gv=gv"
local move_block_up = ":m '<-2<CR>gv=gv"

local paste_without_lose_data = "\"_dP"

local copy_to_clipboard = "\"+y"

local function move_line_down()
	pcall(vim.cmd, 'm +1')
end

local function move_line_up()
	pcall(vim.cmd, 'm -2')
end

local function split_terminal()
	local is_nvim_tree = string.find(vim.api.nvim_buf_get_name(0), "NvimTree") ~= nil
	local split_command = utils.ternary(is_nvim_tree, "bel vsplit", "bel 15split")

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
end

local function split_terminal_to_right_and_focus()
	vim.cmd("bel vsplit")
	vim.cmd("term")
	vim.cmd("startinsert")
end

local format_code = vim.lsp.buf.format


---------------------------------------------------------
--													   --
--						Keybinds					   --
--													   --
---------------------------------------------------------

-- Additional rebinds may be in /after/plugin files
-- Search for /vim.keymap.set using treesitter


-- Move up and down the lines selected
vim.keymap.set('v', 'J', move_block_down)
vim.keymap.set('v', 'K', move_block_up)

-- Move up and down the lines selected
vim.keymap.set('n', '<leader>k', move_line_up)
vim.keymap.set('n', '<leader>j', move_line_down)

-- Format code
vim.keymap.set('n', '<leader>f', format_code)

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', copy_to_clipboard)
vim.keymap.set('v', '<leader>y', copy_to_clipboard)

-- Teminal things
vim.keymap.set("n", "<leader>t", split_terminal)
vim.keymap.set("n", "<leader>rt", split_terminal_to_right_and_focus)

-- Quit terminal
vim.keymap.set('t', '<ESC>', exit_to_normal_mode)

-- Paste after selection without losing data
vim.keymap.set('x', '<leader>p', paste_without_lose_data)
