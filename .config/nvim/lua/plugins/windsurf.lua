return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = ":Codeium Auth",
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = {
					accept = "<A-y>",
					accept_word = "<A-w>",
					accept_line = "<A-l>",
					clear = "<A-e>",
					next = "<A-RIGHT>",
					prev = "<A-LEFT>",
				},
			},
		})
	end,
}
