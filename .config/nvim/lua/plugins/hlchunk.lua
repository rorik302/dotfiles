return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				chars = {
					right_arrow = "─",
				},
				style = {
					{ fg = "#ffcc66" },
				},
				use_treesitter = true,
			},
			line_num = {
				enable = true,
				style = {
					{ fg = "#ffcc66" },
				},
				use_treesitter = true,
			},
		})
	end,
}
