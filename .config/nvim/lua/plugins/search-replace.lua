vim.keymap.set("n", "<leader>ro", ":SearchReplaceSingleBufferOpen<CR>", { desc = "Replace: In Open Buffer" })
vim.keymap.set("n", "<leader>rw", ":SearchReplaceSingleBufferCWord<CR>", { desc = "Replace: Word" })

return {
	"roobert/search-replace.nvim",
	config = function()
		require("search-replace").setup()
	end,
}
