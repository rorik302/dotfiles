return {
	"uga-rosa/ccc.nvim",
	config = function()
		local ccc = require("ccc")

		ccc.setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})

		local map = require("utils").map
		map("<leader>cc", ":CccPick<CR>", { desc = "Pick color" })
	end,
}
