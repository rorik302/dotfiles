return {
	"uga-rosa/ccc.nvim",
	config = function()
		require("ccc").setup({
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
		})

		vim.keymap.set("n", "<leader>cc", ":CccPick<CR>", { desc = "CCC: Pick Color" })
	end,
}
