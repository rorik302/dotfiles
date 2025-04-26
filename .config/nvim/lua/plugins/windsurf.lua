return {
	"Exafunction/windsurf.nvim",
	build = ":Codeium Auth",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = false,
			virtual_text = {
				enabled = true,
				key_bindings = {
					accept = "<C-y>",
					accept_word = "<C-w>",
					accept_line = "<C-l>",
					clear = "<C-e>",
					next = "<C->>",
					prev = "<C-<>",
				},
			},
		})
	end,
}
