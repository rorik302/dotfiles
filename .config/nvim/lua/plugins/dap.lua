local dap_view = {
	"igorlfs/nvim-dap-view",
	config = function()
		vim.keymap.set("n", "<leader>du", ":DapViewToggle<CR>", { desc = "Debug: Toggle UI", silent = true })
	end,
}

local dap_virtual_text = {
	"TheHamsta/nvim-dap-virtual-text",
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}

local dap_python = {
	"mfussenegger/nvim-dap-python",
	config = function()
		local dap_python = require("dap-python")

		dap_python.setup("uv")
		dap_python.test_runner = "pytest"

		vim.keymap.set("n", "<leader>dn", require("dap-python").test_method, { desc = "Debug: Test Method (Python)" })
		vim.keymap.set("n", "<leader>df", require("dap-python").test_class, { desc = "Debug: Test Class (Python)" })
		vim.keymap.set("n", "<leader>ds", require("dap-python").debug_selection, { desc = "Debug: Selection (Python)" })
	end,
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		dap_view,
		dap_virtual_text,
		dap_python,
	},
	config = function()
		vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "Debug: Start/Continue Debugger" })
		vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dt", require("dap").terminate, { desc = "Debug: Terminate" })
	end,
}
