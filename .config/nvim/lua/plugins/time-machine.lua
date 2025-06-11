vim.keymap.set("n", "<leader>tt", ":TimeMachineToggle<CR>", { desc = "Time Machine: Toggle Tree", silent = true })
vim.keymap.set("n", "<leader>tx", ":TimeMachinePurgeBuffer<CR>", { desc = "Time Machine: Purge Current Buffer" })
vim.keymap.set("n", "<leader>tX", ":TimeMachinePurgeAll<CR>", { desc = "Time Machine: Purge All" })
vim.keymap.set("n", "<leader>tl", ":TimeMachineLogShow<CR>", { desc = "Time Machine: Show Log" })

return {
	"y3owk1n/time-machine.nvim",
	cmd = {
		"TimeMachineToggle",
		"TimeMachinePurgeBuffer",
		"TimeMachinePurgeAll",
		"TimeMachineLogShow",
		"TimeMachineLogClear",
	},
	config = function()
		require("time-machine").setup({
			diff_tool = "delta",
		})
	end,
}
