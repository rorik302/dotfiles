return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		require("flash").setup({
			modes = {
				char = {
					enabled = false,
				},
			},
		})

		vim.keymap.set({ "n", "x", "o" }, "f", function()
			require("flash").jump()
		end, { desc = "Flash: Jump" })
	end,
}
