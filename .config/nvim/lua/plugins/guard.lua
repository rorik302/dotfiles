return {
	"nvimdev/guard.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("stylua")

		-- Возможно нужно отключить линтинг ruff, т.к. lsp уже это делает
		ft("python"):fmt("ruff"):lint("mypy").append("ruff")
	end,
}
