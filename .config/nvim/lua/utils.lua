local M = {}

function M.map(keymap, command, opts, mode)
	mode = mode or "n"

	local default_opts = { noremap = true, silent = true }
	opts = vim.tbl_extend("force", default_opts, opts or {})

	vim.keymap.set(mode, keymap, command, opts)
end

return M
