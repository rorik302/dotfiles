return {
	"WhoisSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d",
				"debugpy",
				"hadolint",
				"htmlhint",
				"jsonlint",
				"markdownlint",
				"mypy",
				"prettier",
				"pyproject-fmt",
				"ruff",
				"stylelint",
        "stylua",
				"yamllint",
			},
		})
	end,
}
