return {
	"rmagatti/goto-preview",
	event = "BufEnter",
	config = function()
		require("goto-preview").setup()

		vim.keymap.set("n", "grd", require("goto-preview").goto_preview_definition, { desc = "LSP: Goto Definition" })
		vim.keymap.set("n", "grD", require("goto-preview").goto_preview_declaration, { desc = "LSP: Goto Declaration" })
		vim.keymap.set(
			"n",
			"gri",
			require("goto-preview").goto_preview_implementation,
			{ desc = "LSP: Goto Implementation" }
		)
		vim.keymap.set("n", "grr", require("goto-preview").goto_preview_references, { desc = "LSP: Goto References" })
		vim.keymap.set(
			"n",
			"grt",
			require("goto-preview").goto_preview_type_definition,
			{ desc = "LSP: Goto Type Definition" }
		)
		vim.keymap.set("n", "grc", require("goto-preview").close_all_win, { desc = "LSP: Close Preview" })
	end,
}
