require("harpoon").setup()

local ui = require('harpoon.ui')
local mark = require('harpoon.mark')


---@param page number
local function move_to_file(page)
	vim.keymap.set('n', '<leader>' .. page, function()
		ui.nav_file(page)
	end)
end

vim.keymap.set('n', '<C-q>', function()
	ui.toggle_quick_menu()
end, {})

-- Quick Add file
vim.keymap.set('n', '<leader>qa', function()
	mark.add_file()
end, {})

move_to_file(1)
move_to_file(2)
move_to_file(3)
move_to_file(4)
move_to_file(5)
