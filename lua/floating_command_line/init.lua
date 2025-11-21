local M = {}

M.open = function()
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event
	local cmp = require("cmp")

	cmp.setup.filetype("NuiInput", {
		mapping = cmp.mapping.preset.insert(),
		sources = cmp.config.sources({
			{ name = "path" },
			{ name = "cmdline" },
		}),
	})

	local input = Input({
		position = "50%",
		size = {
			width = 60,
		},
		border = {
			style = "rounded",
			text = {
				top = "Enter command",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "→ ",
		default_value = "",
		on_submit = function(value)
			vim.cmd(value)
		end,
	})

	input:map("i", "<ESC>", function()
		input:unmount()
		print("command line closed")
	end)

	input:mount()

	local bufnr = input.bufnr

	require("cmp").setup.buffer({
		mapping = {
			["<Tab>"] = require("cmp").mapping(function(fallback)
				local cmp = require("cmp")
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					cmp.complete()
				end
			end),
		},
		sources = {
			{ name = "path" },
			{ name = "cmdline" },
		},
	})

	vim.bo[bufnr].filetype = "NuiInput"

	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

return M
