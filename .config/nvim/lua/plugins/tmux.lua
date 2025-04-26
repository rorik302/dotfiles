return {
	"aserowy/tmux.nvim",
	config = function()
		require("tmux").setup({
			navigation = {
				cycle_navigation = false,
				enable_default_keybindings = true,
			},
			resize = {
				enable_default_keybindings = true,
				resize_step_x = 1,
				resize_step_y = 1,
			},
		})
	end,
}
