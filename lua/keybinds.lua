local normal_mode = "n"
local terminal_mode = "t"
local visual_mode = "v"
local select_mode = "x"

-- Move selected lines up and down
vim.keymap.set(visual_mode, "J", ":m '>+1<CR>gv=gv", { desc = "Move selected Down [J] = Down" })
vim.keymap.set(visual_mode, "K", ":m '<-2<CR>gv=gv", { desc = "Move selected Up [K] = Up" })

-- Yank text inside device clipboard
vim.keymap.set(normal_mode, "<leader>y", '"+y', { desc = "[Y]ank to clipboard" })
vim.keymap.set(visual_mode, "<leader>y", '"+y', { desc = "[Y]ank to clipboard" })

-- Allows to keep the element yanked inside the buffer
vim.keymap.set(select_mode, "<leader>p", '"_dP', { desc = "[P]aste without losing data" })

-- Create a terminal split
vim.keymap.set(normal_mode, "<leader>t", function()
	vim.cmd("bel 15split")
	vim.cmd("term")
	vim.cmd("startinsert")
end, { desc = "Open [T]erminal in split" })

vim.keymap.set(normal_mode, "<leader>rt", function()
	vim.cmd("bel vsplit")
	vim.cmd("term")
	vim.cmd("startinsert")
end, { desc = "Open [T]erminal to [R]ight split" })
