return {
	"wintermute-cell/gitignore.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitignore = require("gitignore")

		local map = require("utils").map
		map("<leader>gi", gitignore.generate, { desc = "Git: Generate .gitignore" })
	end,
}
