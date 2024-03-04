return {
	"rebelot/heirline.nvim",
	version = "*",
	config = function()
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		local Space = { provider = " " }

		local FileNameBlock = {
			-- let's first set up some attributes needed by this component and it's children
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}

		local FileIcon = {
			init = function(self)
				local filename = self.filename
				local extension = vim.fn.fnamemodify(filename, ":e")
				self.icon, self.icon_color =
					require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
			end,
			provider = function(self)
				return self.icon and (self.icon .. "  ")
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local FileName = {
			provider = function(self)
				local filename = vim.fn.fnamemodify(self.filename, ":.")
				if filename == "" then
					return "[No Name]"
				end
				if not conditions.width_percent_below(#filename, 0.25) then
					filename = vim.fn.pathshorten(filename)
				end
				return filename
			end,
			hl = { fg = utils.get_highlight("Directory").fg },
		}

		local FileFlags = {
			{
				condition = function()
					return vim.bo.modified
				end,
				provider = " •",
				hl = { fg = "yellow" },
			},
			{
				condition = function()
					return not vim.bo.modifiable or vim.bo.readonly
				end,
				provider = "",
				hl = { fg = "orange" },
			},
		}

		local FileNameModifer = {
			hl = function()
				if vim.bo.modified then
					return { fg = "yellow", bold = true, force = true }
				end
			end,
		}

		FileNameBlock = utils.insert(
			FileNameBlock,
			FileIcon,
			utils.insert(FileNameModifer, FileName),
			FileFlags,
			{ provider = "%<" }
		)

		local TerminalName = {
			provider = function()
				local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
				return "  " .. tname
			end,
			hl = { fg = "white", bold = true },
		}

		local FileType = {
			provider = function()
				return string.upper(vim.bo.filetype)
			end,
			hl = { fg = utils.get_highlight("Type").fg, bold = true },
		}

		local WinBars = {
			fallthrough = false,
			{
				condition = function()
					return conditions.buffer_matches({ buftype = { "terminal" } })
				end,

				utils.surround({ "██", "██" }, "#000000", {
					FileType,
					Space,
					TerminalName,
				}),
			},
			utils.surround({ "██", "██" }, "#000000", FileNameBlock),
		}

		local function setup_colors()
			return {
				bright_bg = utils.get_highlight("Folded").bg,
				bright_fg = utils.get_highlight("Folded").fg,
				red = utils.get_highlight("DiagnosticError").fg,
				dark_red = utils.get_highlight("DiffDelete").bg,
				green = utils.get_highlight("String").fg,
				blue = utils.get_highlight("Function").fg,
				gray = utils.get_highlight("NonText").fg,
				orange = utils.get_highlight("Constant").fg,
				purple = utils.get_highlight("Statement").fg,
				cyan = utils.get_highlight("Special").fg,
				diag_warn = utils.get_highlight("DiagnosticWarn").fg,
				diag_error = utils.get_highlight("DiagnosticError").fg,
				diag_hint = utils.get_highlight("DiagnosticHint").fg,
				diag_info = utils.get_highlight("DiagnosticInfo").fg,
				git_del = utils.get_highlight("diffDeleted").fg,
				git_add = utils.get_highlight("diffAdded").fg,
				git_change = utils.get_highlight("diffChanged").fg,
			}
		end

		vim.api.nvim_create_augroup("Heirline", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				utils.on_colorscheme(setup_colors)
			end,
			group = "Heirline",
		})

		require("heirline").setup({
			winbar = WinBars,
			opts = {
				disable_winbar_cb = function(args)
					--- @type string
					local buffer_name = vim.api.nvim_buf_get_name(args.buf)

					-- Disable winbar on harpoon popup menu
					if string.find(buffer_name, "harpoon-menu", 1, true) ~= nil then
						return true
					end

					return conditions.buffer_matches({
						buftype = { "nofile", "prompt", "help", "quickfix" },
						filetype = { "^git.*", "fugitive", "Trouble", "dashboard" },
					}, args.buf)
				end,
			},
		})
	end,
}
