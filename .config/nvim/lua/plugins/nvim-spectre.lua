return {
	"nvim-pack/nvim-spectre",
	config = function()
		require("spectre").setup()

		local map = require("utils").map
		map("<leader>ss", ":lua require('spectre').toggle()<CR>", { desc = "Spectre: Toggle" })
		map(
			"<leader>sw",
			":lua require('spectre').open_visual({select_word=true})<CR>",
			{ desc = "Spectre: Search current word" }
		)
		map(
			"<leader>sp",
			":lua require('spectre').open_file_search({select_word=true})<CR>",
			{ desc = "Spectre: Search on current file" }
		)
	end,
}
