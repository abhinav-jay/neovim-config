return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				separator = nil,
				scope = {
					enabled = false,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				separator = nil,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				max_lines = 3,
				multiline_threshold = 1,
				trim_scope = "outer",
				mode = "cursor",
			})
		end,
	},

	{
		"wurli/contextindent.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	{
		"HiPhish/nvim-ts-rainbow2",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	},
}
