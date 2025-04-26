return {
	"SuperBo/fugit2.nvim",
	build = false,
	opts = {
		width = 100,
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
	keys = {
		{ "<leader>gf", mode = "n", "<cmd>Fugit2<CR>", desc = "Git: Fugit2" },
	},
}
