return {
	"aznhe21/actions-preview.nvim",
	event = "VeryLazy",
	config = function()
		local ap = require("actions-preview")

		ap.setup({
			backend = "snacks",
			snacks = {
				layout = {
					preset = "dropdown",
				},
			},
		})

		local map = require("utils").map
		map("<leader>ca", ap.code_actions, { desc = "LSP: Code Actions" }, { "v", "n" })
	end,
}
