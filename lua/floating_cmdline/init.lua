local M = {}

-- Default configuration
M.config = {
	width = 50,
	height = 1,
	line = 0.1, -- vertical position (fraction of screen)
	col = 0.2, -- horizontal position (fraction of screen)
	border = "rounded",
	title = "cmdline",
}

-- Optional setup
function M.setup(opts)
	M.config = vim.tbl_extend("force", M.config, opts or {})
end

-- Open floating command line
function M.open()
	local buf = vim.api.nvim_create_buf(false, true) -- scratch buffer

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = M.config.width,
		height = M.config.height,
		row = math.floor(vim.o.lines * M.config.line),
		col = math.floor(vim.o.columns * M.config.col),
		style = "minimal",
		border = M.config.border,
		title = M.config.title,
	})

	-- Set current window and start insert mode
	vim.api.nvim_set_current_win(win)
	vim.cmd("startinsert")
	vim.api.nvim_buf_set_keymap(
		buf,
		"i",
		"<CR>",
		[[<Esc>:lua require("floating_cmdline").submit()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<CR>",
		[[<Esc>:lua require("floating_cmdline").submit()<CR>]],
		{ noremap = true, silent = true }
	)
	-- Map <Esc> to cancel
	vim.api.nvim_buf_set_keymap(
		buf,
		"i",
		"<Esc>",
		[[<Esc>:lua require("floating_cmdline").close()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_buf_set_keymap(
		buf,
		"n",
		"<Esc>",
		[[<Esc>:lua require("floating_cmdline").close()<CR>]],
		{ noremap = true, silent = true }
	)

	M.buf = buf
	M.win = win
end

-- Execute command
function M.submit()
	if not (M.buf and vim.api.nvim_buf_is_valid(M.buf)) then
		return
	end
	local lines = vim.api.nvim_buf_get_lines(M.buf, 0, -1, false)
	local input = table.concat(lines, " ")
	if input ~= "" then
		vim.cmd(input)
	end
	M.close()
end

-- Close floating window
function M.close()
	if M.win and vim.api.nvim_win_is_valid(M.win) then
		vim.api.nvim_win_close(M.win, true)
	end
	M.buf = nil
	M.win = nil
end

return M
