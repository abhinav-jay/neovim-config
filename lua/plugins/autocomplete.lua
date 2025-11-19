return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp", -- The core completion engine
		dependencies = {
			"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
			"hrsh7th/cmp-nvim-lsp", -- LSP completions
			"hrsh7th/cmp-buffer", -- Buffer words
			"hrsh7th/cmp-path", -- File system paths
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.close(),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
				experimental = { ghost_text = true },
				window = {
					completion = cmp.config.window.bordered({
						border = "rounded", -- Options: "none", "single", "double", "rounded", "solid", "shadow"
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
						col_offset = 0,
						side_padding = 1, -- adds padding on left and right of text
					}),
					documentation = cmp.config.window.bordered({
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
						col_offset = 0,
						side_padding = 1,
					}),
				},
			})
		end,
	},
}
