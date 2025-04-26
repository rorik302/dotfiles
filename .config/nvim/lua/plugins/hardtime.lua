return {
	"m4xshen/hardtime.nvim",
	config = function()
		require("hardtime").setup({
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
		})
	end,
}
