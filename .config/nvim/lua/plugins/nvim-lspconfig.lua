local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, _ = pcall(require, "blink.cmp")
if ok then
	capabilities = require("blink.cmp").get_lsp_capabilities()
end

vim.lsp.config("*", { capabilities = capabilities })

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
})

return {
	"neovim/nvim-lspconfig",
}
