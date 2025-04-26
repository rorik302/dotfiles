return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "powerline",
			options = {
				show_source = {
					enabled = true,
				},
				multilines = {
					enabled = true,
					always_show = true,
				},
				show_all_diag_on_cursorline = true,
			},
		})

		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
}
