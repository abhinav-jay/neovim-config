local M = {}

local colors = {
	bg = "#1c1c2c",
	fg = "#7c7c9c",
	saffron = "#FF9933",
	green = "#138808",
	navy = "#7aa2f7",
	gray = "#8080a0",
	light_orange = "#FFA64D",
	comment = "#7C7C9C",
	visual_bg = "#333353",
	violet = "#7F00FF",
}

-- Clear highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "india"

-- -- Normal and UI
vim.cmd(string.format("hi Normal       guifg=%s guibg=%s", colors.fg, colors.bg))
vim.cmd(string.format("hi Visual       guibg=%s guibg=%s", colors.fg, colors.visual_bg))
vim.cmd(string.format("hi CursorLine   guibg=%s", colors.visual_bg))
vim.cmd(string.format("hi CursorColumn guibg=%s", colors.visual_bg))
vim.cmd(string.format("hi LineNr       guifg=%s guibg=%s", colors.gray, colors.bg))
vim.cmd(string.format("hi CursorLineNr guifg=%s guibg=%s gui=bold", colors.saffron, colors.visual_bg))
vim.cmd(string.format("hi StatusLine   guifg=%s guibg=%s gui=bold", colors.fg, colors.visual_bg))
vim.cmd(string.format("hi StatusLineNC guifg=%s guibg=%s", colors.gray, colors.bg))
--
-- Syntax
vim.cmd(string.format("hi Comment      guifg=%s gui=italic", colors.comment))
vim.cmd(string.format("hi Constant     guifg=%s", colors.light_orange))
vim.cmd(string.format("hi String       guifg=%s", colors.green))
vim.cmd(string.format("hi Number       guifg=%s", colors.light_orange))
vim.cmd(string.format("hi Boolean      guifg=%s", colors.light_orange))
vim.cmd(string.format("hi Identifier   guifg=%s", colors.navy))
vim.cmd(string.format("hi Function     guifg=%s gui=bold", colors.saffron))
vim.cmd(string.format("hi Statement    guifg=%s gui=bold", colors.saffron))
vim.cmd(string.format("hi Conditional  guifg=%s gui=bold", colors.saffron))
vim.cmd(string.format("hi Keyword      guifg=%s gui=bold", colors.saffron))
vim.cmd(string.format("hi Operator     guifg=%s", colors.saffron))
vim.cmd(string.format("hi Type         guifg=%s gui=bold", colors.green))
vim.cmd(string.format("hi Special      guifg=%s", colors.navy))
vim.cmd(string.format("hi PreProc      guifg=%s", colors.saffron))
vim.cmd(string.format("hi Title        guifg=%s gui=bold", colors.saffron))
vim.cmd(string.format("hi Error        guifg=%s guibg=%s gui=bold", colors.fg, colors.saffron))
vim.cmd(string.format("hi Todo         guifg=%s guibg=%s gui=bold", colors.navy, colors.visual_bg))

-- Optional: Treesitter (modern highlighting)
vim.cmd(string.format("hi @comment       guifg=%s gui=italic", colors.comment))
vim.cmd(string.format("hi @keyword       guifg=%s gui=bold", colors.saffron))
vim.cmd(string.format("hi @function      guifg=%s gui=bold", colors.saffron))
vim.cmd(string.format("hi @variable      guifg=%s", colors.navy))
vim.cmd(string.format("hi @string        guifg=%s", colors.green))
vim.cmd(string.format("hi @number        guifg=%s", colors.light_orange))
vim.cmd(string.format("hi @type          guifg=%s gui=bold", colors.green))
vim.cmd(string.format("hi @constant      guifg=%s", colors.light_orange))

return M
