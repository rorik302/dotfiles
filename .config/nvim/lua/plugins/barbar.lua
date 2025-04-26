return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	version = "^1.0.0",
	config = function()
		require("barbar").setup()

		local map = require("utils").map

		map("<C-A-h>", ":BufferPrevious<CR>", { desc = "Buffer: Previous" })
		map("<C-A-l>", ":BufferNext<CR>", { desc = "Buffer: Next" })
		map("<C-A-S-h>", ":BufferMovePrevious<CR>", { desc = "Buffer: Move Previous" })
		map("<C-A-S-l>", ":BufferMoveNext<CR>", { desc = "Buffer: Move Next" })

		map("<leader>b1", ":BufferGoto 1<CR>", { desc = "Buffer: Goto 1" })
		map("<leader>b2", ":BufferGoto 2<CR>", { desc = "Buffer: Goto 2" })
		map("<leader>b3", ":BufferGoto 3<CR>", { desc = "Buffer: Goto 3" })
		map("<leader>b4", ":BufferGoto 4<CR>", { desc = "Buffer: Goto 4" })
		map("<leader>b5", ":BufferGoto 5<CR>", { desc = "Buffer: Goto 5" })
		map("<leader>b6", ":BufferGoto 6<CR>", { desc = "Buffer: Goto 6" })
		map("<leader>b7", ":BufferGoto 7<CR>", { desc = "Buffer: Goto 7" })
		map("<leader>b8", ":BufferGoto 8<CR>", { desc = "Buffer: Goto 8" })
		map("<leader>b9", ":BufferGoto 9<CR>", { desc = "Buffer: Goto 9" })
		map("<leader>b0", ":BufferLast<CR>", { desc = "Buffer: Goto Last" })

		map("<leader>bP", ":BufferPin<CR>", { desc = "Buffer: Pin" })
	end,
}
