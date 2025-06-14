return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "selene" },
			python = { "ruff" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			vue = { "eslint_d" },
			html = { "eslint_d" },
			css = { "stylelint" },
			scss = { "stylelint" },
			dockerfile = { "hadolint" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
