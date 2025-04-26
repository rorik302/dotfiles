return {
	"neolooong/whichpy.nvim",
	dependencies = {
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		require("whichpy").setup()
	end,
}
