return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		require("flash").setup()

		local map = require("utils").map
		map("f", function()
			require("flash").jump()
		end, { desc = "Flash", noremap = true }, { "n", "x", "o" })
	end,
}
