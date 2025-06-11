return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.barbar_auto_setup = false

		require("barbar").setup({
			sidebar_filetypes = {
				snacks_picker_list = true,
			},
		})

		vim.keymap.set("n", "<C-S-h>", ":BufferPrevious<CR>", { desc = "Buffer: Previous" })
		vim.keymap.set("n", "<C-S-l>", ":BufferNext<CR>", { desc = "Buffer: Next" })
		vim.keymap.set("n", "<C-S-A-h>", ":BufferMovePrevious<CR>", { desc = "Buffer: Move Previous" })
		vim.keymap.set("n", "<C-S-A-l>", ":BufferMoveNext<CR>", { desc = "Buffer: Move Next" })

		vim.keymap.set("n", "<leader>b1", ":BufferGoto 1<CR>", { desc = "Buffer: Goto 1" })
		vim.keymap.set("n", "<leader>b2", ":BufferGoto 2<CR>", { desc = "Buffer: Goto 2" })
		vim.keymap.set("n", "<leader>b3", ":BufferGoto 3<CR>", { desc = "Buffer: Goto 3" })
		vim.keymap.set("n", "<leader>b4", ":BufferGoto 4<CR>", { desc = "Buffer: Goto 4" })
		vim.keymap.set("n", "<leader>b5", ":BufferGoto 5<CR>", { desc = "Buffer: Goto 5" })
		vim.keymap.set("n", "<leader>b6", ":BufferGoto 6<CR>", { desc = "Buffer: Goto 6" })
		vim.keymap.set("n", "<leader>b7", ":BufferGoto 7<CR>", { desc = "Buffer: Goto 7" })
		vim.keymap.set("n", "<leader>b8", ":BufferGoto 8<CR>", { desc = "Buffer: Goto 8" })
		vim.keymap.set("n", "<leader>b9", ":BufferGoto 8<CR>", { desc = "Buffer: Goto 9" })
		vim.keymap.set("n", "<leader>b0", ":BufferLast<CR>", { desc = "Buffer: Goto Last" })

		vim.keymap.set("n", "<leader>bP", ":BufferPin<CR>", { desc = "Buffer: Pin" })
	end,
}
