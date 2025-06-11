return {
	"Wansmer/treesj",
	config = function()
		local treesj = require("treesj")

		treesj.setup({
			use_default_keymaps = false,
		})

		vim.keymap.set("n", "<leader>j", treesj.toggle, { desc = "Treesj: Toggle" })
		vim.keymap.set("n", "<leader>J", function()
			treesj.toggle({ split = { recursive = true } })
		end, { desc = "Treesj: Toggle Recursive" })
	end,
}
