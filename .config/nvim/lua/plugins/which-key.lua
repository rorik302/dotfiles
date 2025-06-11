return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").add({
			{ "<leader>b", name = "Buffers" },
			{ "<leader>c", name = "Color" },
			{ "<leader>d", name = "Debug" },
			{ "<leader>e", name = "Explorer" },
			{ "<leader>f", name = "Find" },
			{ "<leader>g", name = "Git" },
			{ "<leader>n", name = "Notification" },
			{ "<leader>q", name = "Nvim: Quit" },
			{ "<leader>r", name = "Rename/Rule" },
			{ "<leader>s", name = "Surround" },
			{ "<leader>t", name = "Time Machine/Terminal" },
			{ "<leader>u", name = "UI" },
			{ "<leader>w", name = "Nvim: Save" },
		})
	end,
}
