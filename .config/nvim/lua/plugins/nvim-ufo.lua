return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local o = vim.opt
		o.foldcolumn = "1"
		o.foldlevel = 99
		o.foldlevelstart = 99
		o.foldenable = true

		local ufo = require("ufo")

		local map = require("utils").map
		map("zR", ufo.openAllFolds)
		map("zM", ufo.closeAllFolds)

		require("ufo").setup()
	end,
}
