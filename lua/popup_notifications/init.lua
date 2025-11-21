local M = {}

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

M.notify = function(n)
	local popup = Popup({
		enter = false,
		focusable = false,
		border = {
			style = "rounded",
		},
		position = "90%",
		size = {
			width = "40",
			height = "2",
		},
	})

	-- mount/open the component
	popup:mount()

	-- unmount buffer when any cursor moves in any buffer
	vim.api.nvim_create_autocmd("CursorMoved", {
		callback = function()
			if popup then
				popup:unmount()
				popup = nil
			end
		end,
	})

	-- set content
	vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { n })
end

vim.notify = M.notify
vim.notify("custom notification just loaded")

return M
