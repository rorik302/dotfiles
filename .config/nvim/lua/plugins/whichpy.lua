return {
	"neolooong/whichpy.nvim",
	ft = { "python" },
	config = function()
		require("whichpy").setup({
			locator = {
				conda = {
					enable = false,
				},
				pdm = {
					enable = false,
				},
				poetry = {
					enable = false,
				},
				uv = {
					enable = true,
					display_name = "uv",
				},
			},
		})
	end,
}
