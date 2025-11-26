return {
	-- rose pine theme
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	-- good enough theme I think
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
	},
	-- monochrome theme
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
	},
	-- tokyonight default theme
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			style = "night",
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
