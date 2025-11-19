vim.opt.number = true
vim.opt.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.keymap.set("n", "<leader>o", "za", { desc = "toggle fold" })
vim.api.nvim_set_keymap(
	"t",
	"<Esc><Esc>",
	[[<C-\><C-n>]],
	{ noremap = true, silent = true, desc = "exit terminal mode" }
)
vim.keymap.set("n", "<leader>te", "<CMD>ToggleTerm<CR>", { desc = "open terminal" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "go up" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "go down" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "go right" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "go left" })

-- use floating_cmdline
-- vim.keymap.set('n', ':', function()
-- 	require("floating_cmdline").open()
-- end, { noremap = true, silent = true })

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
		-- you can add other fields for setting up lsp server in this table
	})
end
require("ufo").setup()
vim.opt.shell = "/usr/bin/fish"
