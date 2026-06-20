return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			bg = "#320305",
			black = "#320305",
			fg = "#ffba08",
			yellow = "#ffba08",
			saffron = "#f48c06",
			green = "#d03040",
			blue = "#d03040",
			navy = "#e85d04",
			gray = "#e55555",
			light_orange = "#f48c06",
			comment = "#a55555",
			visual_bg = "#6a040f",
			violet = "#e55555",
			light_blue = "#d03040",
			red = "#d03040",
			white = "#ffaaaa",
		}
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "|", right = "|" },
				disabled_filetypes = { statusline = {}, winbar = {} },
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
				theme = {
					normal = {
						a = { bg = colors.white, fg = colors.black, gui = "bold" },
						b = { bg = colors.lightgray, fg = colors.white },
						c = { bg = colors.darkgray, fg = colors.gray },
					},
					insert = {
						a = { bg = colors.navy, fg = colors.black, gui = "bold" },
						b = { bg = colors.lightgray, fg = colors.white },
						c = { bg = colors.lightgray, fg = colors.white },
					},
					visual = {
						a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
						b = { bg = colors.lightgray, fg = colors.white },
						c = { bg = colors.inactivegray, fg = colors.black },
					},
					command = {
						a = { bg = colors.saffron, fg = colors.black, gui = "bold" },
						b = { bg = colors.lightgray, fg = colors.white },
						c = { bg = colors.inactivegray, fg = colors.black },
					},
					inactive = {
						a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
						b = { bg = colors.darkgray, fg = colors.gray },
						c = { bg = colors.darkgray, fg = colors.gray },
					},
				},
				sections = {
					lualine_a = {
						function()
							local mode = vim.fn.mode() -- Get the current mode
							local icons = {
								n = "  ",
								i = " 󰏫 ",
								v = "  ",
								V = "  ",
								c = "  ",
								R = "  R",
								t = "  ",
							}
							return icons[mode] or "  " -- Default icon if mode is not mapped
						end,
					},
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = {
						{
							"filename",
							path = 1,
							symbols = { modified = "●", readonly = "", unnamed = "[No Name]" },
						},
					},
					lualine_x = { "encoding", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			},
		})
	end,
}
