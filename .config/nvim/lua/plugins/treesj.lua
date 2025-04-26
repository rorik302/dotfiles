return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local treesj = require("treesj")

		treesj.setup({
			use_default_keymaps = false,
		})

		local map = require("utils").map
		map("<leader>j", treesj.toggle, { desc = "Toggle Split/Join" })
		map("<leader>J", function()
			treesj.toggle({ split = { recursive = true } })
		end, { desc = "Toggle Split/Join: Recursive" })
	end,
}
