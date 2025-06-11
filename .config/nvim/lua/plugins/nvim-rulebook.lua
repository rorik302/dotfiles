return {
	"chrisgrieser/nvim-rulebook",
	config = function()
		require("rulebook").setup({
			ruleDocs = {
				fallback = "https://google.com/search?q=%s",
			},
		})

		vim.diagnostic.config({
			virtual_text = {
				suffix = function(diag)
					return require("rulebook").hasDocs(diag) and "  " or ""
				end,
			},
		})

		vim.keymap.set("n", "<leader>ri", function()
			require("rulebook").ignoreRule()
		end, { desc = "Rule: Ignore" })
		vim.keymap.set("n", "<leader>rl", function()
			require("rulebook").lookupRule()
		end, { desc = "Rule: Lookup" })
		vim.keymap.set("n", "<leader>ry", function()
			require("rulebook").yankDiagnosticCode()
		end, { desc = "Rule: Yank Diagnostic Code" })
		vim.keymap.set({ "n", "x" }, "<leader>rf", function()
			require("rulebook").suppressFormatter()
		end, { desc = "Rule: Suppress Formatter" })
	end,
}
