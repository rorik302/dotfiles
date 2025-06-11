return {
	"rachartier/tiny-code-action.nvim",
	event = "LspAttach",
	config = function()
		require("tiny-code-action").setup({
			backend = "delta",
			picker = {
				"snacks",
				-- opts = {
				-- 	layout = "vertical",
				-- },
				opts = {
					layout = {
						layout = {
							backdrop = true,
							width = 0.5,
							min_width = 80,
							height = 0.5,
							min_height = 10,
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", height = 0.3, border = "none" },
							{ win = "preview", title = "{preview}", border = "top" },
						},
					},
				},
			},
			backend_opts = {
				delta = {
					args = {
						"--line-numbers",
					},
				},
			},

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
				callback = function(event)
					vim.keymap.set("n", "gra", function()
						require("tiny-code-action").code_action()
					end, { desc = "LSP: Code Action" })
					vim.keymap.set("v", "gra", function()
						require("tiny-code-action").code_action()
					end, { desc = "LSP: Code Action (Current Buffer)", buffer = event.buf })
				end,
			}),
		})
	end,
}
