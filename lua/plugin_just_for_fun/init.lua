local Popup = require("nui.popup")
local Layout = require("nui.layout")

vim.cmd([[set ls=0]])

local popup_one, popup_two = Popup({
	enter = true,
	border = "rounded",
}), Popup({
	border = "rounded",
})

local layout = Layout(
	{
		position = "50%",
		size = {
			width = "100%",
			height = "100%",
		},
	},
	Layout.Box({
		Layout.Box(popup_one, { size = "10%" }),
		Layout.Box(popup_two, { size = "90%" }),
	}, { dir = "col" })
)

popup_one:map("n", "q", function()
	vim.cmd([[q]])
	vim.cmd([[set ls=2]])
end, {})

layout:mount()
