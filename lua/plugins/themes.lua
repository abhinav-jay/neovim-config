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
	-- theme switcher, available with <leader>ft
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					{
						name = "tokyonight-night",
						colorscheme = "tokyonight",
					},
					{
						name = "india-custom",
						colorscheme = "india",
					},
					{
						name = "rose-pine",
						colorscheme = "rose-pine",
					},
					{
						name = "tokyonight-storm",
						colorscheme = "tokyonight-storm",
					},
					{
						name = "neon",
						colorscheme = "citruszest",
					},
					{
						name = "tokyonight-day",
						colorscheme = "tokyonight-day",
					},
					{
						name = "france-custom",
						colorscheme = "france",
					},
					{
						name = "monochrome",
						colorscheme = "lackluster",
					},
					{
						name = "monochrome-hack",
						colorscheme = "lackluster-hack",
					},
					{
						name = "monochrome-mint",
						colorscheme = "lackluster-mint",
					},
				},
			})
			vim.keymap.set("n", "<leader>ft", ":Themery<CR>", { desc = "theme switcher" })
		end,
	},
}
