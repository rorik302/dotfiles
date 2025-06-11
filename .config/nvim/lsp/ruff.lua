return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "requirements.txt", "ruff.toml", ".ruff.toml", ".git" },
	single_file_support = true,
	init_options = {
		settings = {
			organizeImports = true,
			fixAll = true,
		},
	},
	on_attach = function(client)
		client.server_capabilities.hoverProvider = false
	end,
}
