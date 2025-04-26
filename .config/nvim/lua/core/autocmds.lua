local a = vim.api.nvim_create_autocmd

local function augroup(name, clear)
	local clear_opt = clear or true
	return vim.api.nvim_create_augroup("user." .. name, { clear = clear_opt })
end

-- Подсветка копируемого текста
a("TextYankPost", {
	desc = "Highlight when yanking text",
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Показывать cursorline только в активном окне
a("WinEnter", {
	group = augroup("active_cursorline"),
	callback = function()
		vim.opt_local.cursorline = true
	end,
})
a("WinLeave", {
	group = augroup("active_cursorline"),
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-- Использование 4 отступов для некоторых файлов
a("FileType", {
	desc = "4 spaces for these files types",
	pattern = { "python" },
	group = augroup("four_spaces"),
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
	end,
})

-- Переход к последней позиции в файле
a("BufReadPost", {
	group = augroup("last_location"),
	callback = function(event)
		local exclude = { "gitcommit", "commit", "gitrebase" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
			return
		end
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Подсвечивание слова, на котором курсор
a("LspAttach", {
	group = augroup("lsp_attach"),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_group = augroup("lsp_highlight", false)
			a({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_group,
				callback = function()
					vim.lsp.buf.document_highlight()
				end,
			})

			a({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_group,
				callback = function()
					vim.lsp.buf.clear_references()
				end,
			})

			a("LspDetach", {
				group = augroup("lsp_detach", false),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = event2.buf })
				end,
			})
		end
	end,
})
