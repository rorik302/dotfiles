return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "─",
				},
				style = {
					{ fg = "#ffcc66" },
				},
			},
			line_num = {
				enable = true,
				style = {
					{ fg = "#ffcc66" },
				},
			},
		})
	end,
}
