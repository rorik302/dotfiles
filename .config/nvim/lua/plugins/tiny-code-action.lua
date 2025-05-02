return {
	"rachartier/tiny-code-action.nvim",
	event = "LspAttach",
	config = function()
		require("tiny-code-action").setup({
			backend = "delta",
			picker = {
				"snacks",
				opts = {
					layout = "vertical",
				},
			},
			backend_opts = {
				delta = {
					args = {
						"--line-numbers",
					},
				},
			},
		})

		local map = require("utils").map
		map("<leader>ca", function()
			require("tiny-code-action").code_action()
		end)
	end,
}
