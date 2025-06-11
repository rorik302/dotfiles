vim.diagnostic.config({ virtual_text = false })

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 10,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "powerline",
			options = {
				show_source = {
					enabled = true,
				},
				use_icons_from_diagnostic = true,
				multilines = {
					enabled = true,
					always_show = true,
				},
				show_all_diag_on_cursorline = true,
			},
		})
	end,
}
