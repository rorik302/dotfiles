local lsp_servers = {
	"cssls",
	"dockerls",
	"html",
	"hyprls",
	"jsonls",
	"eslint",
	"lua_ls",
	"marksman",
	"pyright",
	"sqlls",
	"taplo",
	"ts_ls",
	"vue_ls",
	"yamlls",
}

local tools = {
	"black",
	"debugpy",
	"eslint_d",
	"hadolint",
	"prettier",
	"ruff",
	"stylelint",
	"stylua",
}

return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = lsp_servers,
		})
		require("mason-tool-installer").setup({
			ensure_installed = tools,
		})
	end,
}
