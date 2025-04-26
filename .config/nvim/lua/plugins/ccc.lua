return {
	"uga-rosa/ccc.nvim",
	config = function()
		require("ccc").setup()

		local map = require("utils").map
		map("<leader>cc", ":CccPick<CR>", { desc = "Pick color" })
	end,
}
