return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff", "black" },
				toml = { "taplo" },
				json = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				jsx = { "prettier" },
				vue = { "prettier" },
				html = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
		})
	end,
}
