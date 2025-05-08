return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function()
		local lsp_config = require("lspconfig")

		local lsp_settings = {
			lua_ls = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					workspace = {
						library = { vim.env.VIMRUNTIME },
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}

		local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()

		lsp_capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local servers = require("mason-lspconfig").get_installed_servers()
		for _, server in ipairs(servers) do
			local capabilities = vim.tbl_deep_extend("force", {}, lsp_capabilities, server.capabilities or {})

			lsp_config[server].setup({
				capabilities = capabilities,
				settings = lsp_settings[server],
				on_attach = function(client)
					if server == "ruff" then
						client.server_capabilities.hoverProvider = false
					end
				end,
			})

			lsp_config.pyright.setup({
				settings = {
					pyright = {
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							ignore = { "*" },
						},
					},
				},
			})
		end

		require("lspconfig.ui.windows").default_options.border = "rounded"

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				},
			},
			virtual_text = {
				source = true,
				prefix = "● ",
			},
			float = {
				source = true,
				border = "rounded",
			},
		})
	end,
}
