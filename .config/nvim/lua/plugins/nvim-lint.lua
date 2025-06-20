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

		table.insert(lint.linters.selene.args, function()
			local root = vim.fs.root(0, "selene.toml")

			if not root then
				root = vim.fn.stdpath("config")
			end

			return string.format("--config=%s", vim.fs.joinpath(root, "selene.toml"))
		end)

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
