local M = {}

vim.opt.termguicolors = true

local colors = {
	bg = "#171b26",
	cursor = "#23293a",
	black = "#11151f",

	fg = "#c8d3f5",
	white = "#ffffff",

	yellow = "#ffc777",
	saffron = "#ff966c",

	green = "#7ce38b",

	blue = "#82aaff",
	light_blue = "#86e1fc",
	navy = "#6ea8fe",

	red = "#ff757f",

	gray = "#5f6c94",
	comment = "#63739c",

	visual_bg = "#33467c66",

	violet = "#c099ff",

	light_orange = "#ff966c",

	border = "#1c2233",
	line = "#252d42",
	error = "#ff757f",
}

require("lualine").setup({
	options = {
		theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
				b = { bg = colors.border, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.gray },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.border, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.gray },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.black, gui = "bold" },
				b = { bg = colors.border, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.gray },
			},
			command = {
				a = { bg = colors.saffron, fg = colors.black, gui = "bold" },
				b = { bg = colors.border, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.gray },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.border, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.gray },
			},
			inactive = {
				a = { bg = colors.bg, fg = colors.gray },
				b = { bg = colors.bg, fg = colors.gray },
				c = { bg = colors.bg, fg = colors.gray },
			},
		},
	},
})

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "houston"

-- UI
vim.cmd(string.format("hi Normal guifg=%s guibg=%s", colors.fg, colors.bg))
vim.cmd(string.format("hi NormalFloat guifg=%s guibg=%s", colors.fg, colors.border))
vim.cmd(string.format("hi FloatBorder guifg=%s guibg=%s", colors.gray, colors.border))

vim.cmd(string.format("hi Visual guibg=%s", colors.visual_bg))
vim.cmd(string.format("hi CursorLine guibg=%s", colors.cursor))
vim.cmd(string.format("hi CursorColumn guibg=%s", colors.cursor))

vim.cmd(string.format("hi LineNr guifg=%s guibg=%s", colors.gray, colors.bg))
vim.cmd(string.format("hi CursorLineNr guifg=%s gui=bold", colors.yellow))

vim.cmd(string.format("hi SignColumn guibg=%s", colors.bg))
vim.cmd(string.format("hi VertSplit guifg=%s", colors.line))
vim.cmd(string.format("hi WinSeparator guifg=%s", colors.line))

vim.cmd(string.format("hi StatusLine guifg=%s guibg=%s", colors.fg, colors.border))
vim.cmd(string.format("hi StatusLineNC guifg=%s guibg=%s", colors.gray, colors.bg))

vim.cmd(string.format("hi Pmenu guifg=%s guibg=%s", colors.fg, colors.border))
vim.cmd(string.format("hi PmenuSel guifg=%s guibg=%s", colors.black, colors.blue))

vim.cmd(string.format("hi Search guifg=%s guibg=#2b3a66", colors.fg))
vim.cmd(string.format("hi IncSearch guifg=%s guibg=%s", colors.black, colors.yellow))

-- Syntax
vim.cmd(string.format("hi Comment guifg=%s gui=italic", colors.comment))

vim.cmd(string.format("hi String guifg=%s", colors.green))
vim.cmd(string.format("hi Character guifg=%s", colors.green))

vim.cmd(string.format("hi Number guifg=%s", colors.saffron))
vim.cmd(string.format("hi Float guifg=%s", colors.saffron))
vim.cmd(string.format("hi Boolean guifg=%s", colors.saffron))
vim.cmd(string.format("hi Constant guifg=%s", colors.saffron))

vim.cmd(string.format("hi Identifier guifg=%s", colors.fg))
vim.cmd(string.format("hi Variable guifg=%s", colors.fg))

vim.cmd(string.format("hi Function guifg=%s", colors.blue))

vim.cmd(string.format("hi Statement guifg=%s", colors.violet))
vim.cmd(string.format("hi Conditional guifg=%s", colors.violet))
vim.cmd(string.format("hi Repeat guifg=%s", colors.violet))
vim.cmd(string.format("hi Keyword guifg=%s", colors.violet))

vim.cmd(string.format("hi Operator guifg=%s", colors.light_blue))

vim.cmd(string.format("hi Type guifg=%s", colors.yellow))
vim.cmd(string.format("hi Structure guifg=%s", colors.yellow))
vim.cmd(string.format("hi Typedef guifg=%s", colors.yellow))

vim.cmd(string.format("hi PreProc guifg=%s", colors.light_blue))
vim.cmd(string.format("hi Include guifg=%s", colors.light_blue))

vim.cmd(string.format("hi Special guifg=%s", colors.light_blue))
vim.cmd(string.format("hi Tag guifg=%s", colors.light_blue))

vim.cmd(string.format("hi Title guifg=%s gui=bold", colors.green))
vim.cmd(string.format("hi Todo guifg=%s guibg=%s gui=bold", colors.yellow, colors.border))
vim.cmd(string.format("hi Error guifg=%s gui=bold", colors.error))

-- Diagnostics
vim.cmd(string.format("hi DiagnosticError guifg=%s", colors.error))
vim.cmd(string.format("hi DiagnosticWarn guifg=%s", colors.yellow))
vim.cmd(string.format("hi DiagnosticInfo guifg=%s", colors.light_blue))
vim.cmd(string.format("hi DiagnosticHint guifg=%s", colors.blue))

-- Treesitter
vim.cmd(string.format("hi @comment guifg=%s gui=italic", colors.comment))
vim.cmd(string.format("hi @string guifg=%s", colors.green))
vim.cmd(string.format("hi @number guifg=%s", colors.saffron))
vim.cmd(string.format("hi @boolean guifg=%s", colors.saffron))
vim.cmd(string.format("hi @constant guifg=%s", colors.saffron))
vim.cmd(string.format("hi @variable guifg=%s", colors.fg))
vim.cmd(string.format("hi @property guifg=%s", colors.light_blue))
vim.cmd(string.format("hi @field guifg=%s", colors.light_blue))
vim.cmd(string.format("hi @function guifg=%s", colors.blue))
vim.cmd(string.format("hi @method guifg=%s", colors.blue))
vim.cmd(string.format("hi @keyword guifg=%s", colors.violet))
vim.cmd(string.format("hi @operator guifg=%s", colors.light_blue))
vim.cmd(string.format("hi @type guifg=%s", colors.yellow))
vim.cmd(string.format("hi @type.builtin guifg=%s", colors.yellow))
vim.cmd(string.format("hi @tag guifg=%s", colors.light_blue))
vim.cmd(string.format("hi @tag.attribute guifg=%s", colors.violet))

return M
