local M = {}

vim.opt.termguicolors = true

local colors = {
	bg = "#13181d",
	cursor = "#2b3036",
	black = "#1b1f23",

	fg = "#e1e4e8",
	white = "#ffffff",

	yellow = "#ffab70",
	saffron = "#f97583",

	green = "#85e89d",

	blue = "#79b8ff",
	light_blue = "#9ecbff",
	navy = "#79b8ff",

	red = "#ea4a5a",

	gray = "#6a737d",
	comment = "#6a737d",

	visual_bg = "#33424F",

	violet = "#b392f0",

	light_orange = "#ffab70",

	border = "#1f2428",
	line = "#2f363d",
	error = "#f97583",
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
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
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
vim.g.colors_name = "github"

-- UI
vim.cmd(string.format("hi Normal guifg=%s guibg=%s", colors.fg, colors.bg))
vim.cmd(string.format("hi NormalFloat guifg=%s guibg=%s", colors.fg, colors.border))
vim.cmd(string.format("hi FloatBorder guifg=%s guibg=%s", colors.gray, colors.border))

vim.cmd(string.format("hi Visual guibg=%s", colors.visual_bg))
vim.cmd(string.format("hi CursorLine guibg=%s", colors.cursor))
vim.cmd(string.format("hi CursorColumn guibg=%s", colors.cursor))

vim.cmd(string.format("hi LineNr guifg=%s guibg=%s", colors.gray, colors.bg))
vim.cmd(string.format("hi CursorLineNr guifg=%s gui=bold", colors.red))

vim.cmd(string.format("hi SignColumn guibg=%s", colors.bg))
vim.cmd(string.format("hi VertSplit guifg=%s", colors.line))
vim.cmd(string.format("hi WinSeparator guifg=%s", colors.line))

vim.cmd(string.format("hi StatusLine guifg=%s guibg=%s", colors.fg, colors.border))
vim.cmd(string.format("hi StatusLineNC guifg=%s guibg=%s", colors.gray, colors.bg))

vim.cmd(string.format("hi Pmenu guifg=%s guibg=%s", colors.fg, colors.border))
vim.cmd(string.format("hi PmenuSel guifg=%s guibg=%s", colors.fg, colors.visual_bg))

vim.cmd(string.format("hi Search guifg=%s guibg=#ffd33d44", colors.fg))
vim.cmd(string.format("hi IncSearch guifg=%s guibg=#ffd33d", colors.black))

-- Syntax
vim.cmd(string.format("hi Comment guifg=%s gui=italic", colors.comment))

vim.cmd(string.format("hi String guifg=%s", colors.light_blue))
vim.cmd(string.format("hi Character guifg=%s", colors.light_blue))

vim.cmd(string.format("hi Number guifg=%s", colors.blue))
vim.cmd(string.format("hi Float guifg=%s", colors.blue))
vim.cmd(string.format("hi Boolean guifg=%s", colors.blue))
vim.cmd(string.format("hi Constant guifg=%s", colors.blue))

vim.cmd(string.format("hi Identifier guifg=%s", colors.light_orange))
vim.cmd(string.format("hi Variable guifg=%s", colors.fg))

vim.cmd(string.format("hi Function guifg=%s", colors.violet))

vim.cmd(string.format("hi Statement guifg=%s", colors.saffron))
vim.cmd(string.format("hi Conditional guifg=%s", colors.saffron))
vim.cmd(string.format("hi Repeat guifg=%s", colors.saffron))
vim.cmd(string.format("hi Keyword guifg=%s", colors.saffron))

vim.cmd(string.format("hi Operator guifg=%s", colors.fg))

vim.cmd(string.format("hi Type guifg=%s", colors.green))
vim.cmd(string.format("hi Structure guifg=%s", colors.green))
vim.cmd(string.format("hi Typedef guifg=%s", colors.green))

vim.cmd(string.format("hi PreProc guifg=%s", colors.blue))
vim.cmd(string.format("hi Include guifg=%s", colors.blue))

vim.cmd(string.format("hi Special guifg=%s", colors.blue))
vim.cmd(string.format("hi Tag guifg=%s", colors.green))

vim.cmd(string.format("hi Title guifg=%s gui=bold", colors.blue))
vim.cmd(string.format("hi Todo guifg=%s guibg=%s gui=bold", colors.yellow, colors.border))
vim.cmd(string.format("hi Error guifg=%s gui=bold", colors.error))

-- Diagnostics
vim.cmd(string.format("hi DiagnosticError guifg=%s", colors.red))
vim.cmd(string.format("hi DiagnosticWarn guifg=%s", colors.yellow))
vim.cmd(string.format("hi DiagnosticInfo guifg=%s", colors.blue))
vim.cmd(string.format("hi DiagnosticHint guifg=%s", colors.green))

-- Treesitter
vim.cmd(string.format("hi @comment guifg=%s gui=italic", colors.comment))
vim.cmd(string.format("hi @string guifg=%s", colors.light_blue))
vim.cmd(string.format("hi @number guifg=%s", colors.blue))
vim.cmd(string.format("hi @boolean guifg=%s", colors.blue))
vim.cmd(string.format("hi @constant guifg=%s", colors.blue))
vim.cmd(string.format("hi @variable guifg=%s", colors.fg))
vim.cmd(string.format("hi @property guifg=%s", colors.blue))
vim.cmd(string.format("hi @field guifg=%s", colors.blue))
vim.cmd(string.format("hi @function guifg=%s", colors.violet))
vim.cmd(string.format("hi @method guifg=%s", colors.violet))
vim.cmd(string.format("hi @keyword guifg=%s", colors.saffron))
vim.cmd(string.format("hi @operator guifg=%s", colors.fg))
vim.cmd(string.format("hi @type guifg=%s", colors.green))
vim.cmd(string.format("hi @type.builtin guifg=%s", colors.green))
vim.cmd(string.format("hi @tag guifg=%s", colors.green))
vim.cmd(string.format("hi @tag.attribute guifg=%s", colors.blue))

return M
