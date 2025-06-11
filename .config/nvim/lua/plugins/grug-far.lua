return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup()

		vim.keymap.set("n", "<leader>rg", "", { desc = "Replace: GrugFar" })
		vim.keymap.set("n", "<leader>rgg", ":GrugFar<CR>", { desc = "Replace: GrugFar", silent = true })
		vim.keymap.set("n", "<leader>rgw", function()
			require("grug-far").open({ prefills = { paths = vim.fn.expand("%"), search = vim.fn.expand("<cword>") } })
		end, { desc = "Replace: GrugFar (Current File Word)" })
		vim.keymap.set("n", "<leader>rgW", function()
			require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
		end, { desc = "Replace: GrugFar (Word)" })
		vim.keymap.set("n", "<leader>rgf", function()
			require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
		end, { desc = "Replace: GrugFar (Current File)" })
		vim.keymap.set("v", "<leader>rgv", function()
			require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
		end, { desc = "Replace: GrugFar (Visual Current File)" })
		vim.keymap.set("v", "<leader>rgr", function()
			require("grug-far").with_visual_selection({ visualSelectionUsage = "operate-within-range" })
		end, { desc = "Replace: GrugFar (Range)" })
	end,
}
