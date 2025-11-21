local M = {}

local Popup = require("nui.popup")

local popup = nil
local buffer = nil

-- Create namespace (REQUIRED)
local ns = vim.api.nvim_create_namespace("floating_cmdline")

-- Draw content inside the popup
local function render_cmdline(data)
	if not popup or not buffer then
		return
	end

	local prompt = data.prompt or ""
	local content = table.concat(data.content or {}, "")
	local line = prompt .. content

	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, { line })

	-- Move cursor
	pcall(function()
		vim.api.nvim_win_set_cursor(popup.winid, { 1, #prompt + data.pos })
	end)
end

function M.setup()
	vim.ui_attach(ns, { cmdline = true }, function(event, data)
		if event == "cmdline_show" then
			popup = Popup({
				enter = false,
				focusable = false,
				border = { style = "rounded" },
				position = "50%",
				size = { width = math.max(40, #table.concat(data.content, "") + 10), height = 1 },
			})

			popup:mount()
			buffer = popup.bufnr

			render_cmdline(data)
		elseif event == "cmdline_hide" then
			pcall(function()
				if popup then
					popup:unmount()
				end
			end)
			popup = nil
			buffer = nil
		elseif event == "cmdline_pos" then
			render_cmdline(data)
		elseif event == "cmdline_special_char" then
			-- Not needed for minimal version
		end
	end)
end

return M
