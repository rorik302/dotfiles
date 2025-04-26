return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"cssls",
			"dockerls",
			"html",
      "hyprls",
	  	"jsonls",
			"lua_ls",
			"marksman",
			"pyright",
			"sqlls",
			"taplo",
			"ts_ls",
			"volar",
		},
		automatic_installation = true,
	},
}
