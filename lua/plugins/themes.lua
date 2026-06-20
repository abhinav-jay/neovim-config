return {
	-- clean dark theme
	{
		"tiagovla/tokyodark.nvim",
		name = "tokyodark",
	},
	-- rose pine theme
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	-- oxocarbon cool theme
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	-- nord colorscheme
	{
		"shaunsingh/nord.nvim",
	},
	-- cool theme
	{
		"edeneast/nightfox.nvim",
	},
	-- another monochrome theme
	{
		"darkvoid-theme/darkvoid.nvim",
	},
	-- dracula colorscheme
	{
		"mofiqul/dracula.nvim",
	},
	-- cool green theme
	{
		"iruzo/matrix-nvim",
		name = "matrix",
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
			vim.cmd("colorscheme red")
		end,
	},
}
