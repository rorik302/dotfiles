local themes = {
	"tanvirtin/monokai.nvim",
	"judaew/ronny.nvim",
	"polirritmico/monokai-nightasty.nvim",
	"Shatur/neovim-ayu",
}

return {
	"lmantw/themify.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("themify").setup(themes)
	end,
}
