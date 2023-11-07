local theme = require("onedark")

local LINE_NUMBER_BACKGROUND = "NONE"
local CURSOR_LINE_BACKGROUND = "#171c26"

theme.setup({ style = 'dark' })
theme.load()

vim.cmd(string.format('highlight LineNr guifg=#FFFFFF guibg=%s', LINE_NUMBER_BACKGROUND))
vim.cmd(string.format('highlight SignColumn guibg=%s', LINE_NUMBER_BACKGROUND))
vim.cmd(string.format('highlight CursorLine guibg=%s', CURSOR_LINE_BACKGROUND))
vim.cmd(string.format('highlight DiagnosticError guibg=%s guifg=#AA0000', LINE_NUMBER_BACKGROUND))
vim.cmd(string.format('highlight DiagnosticSignError guibg=%s guifg=#AA0000', LINE_NUMBER_BACKGROUND))
vim.cmd(string.format('highlight DiagnosticSignHint guibg=%s guifg=#AA0000', LINE_NUMBER_BACKGROUND))
vim.cmd(string.format('highlight DiagnosticSignInfo guibg=%s guifg=#0b99ff', LINE_NUMBER_BACKGROUND))
vim.cmd(string.format('highlight DiagnosticSignWarn guibg=%s guifg=#fff300', LINE_NUMBER_BACKGROUND))
