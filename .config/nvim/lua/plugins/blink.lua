local cmdline = {
	keymap = { preset = "inherit" },
	completion = {
		ghost_text = { enabled = false },
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
		menu = {
			auto_show = true,
		},
	},
}

local sources = {
	default = { "lazydev", "lsp", "path", "buffer" },
	providers = {
		lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
		codeium = { name = "Codeium", module = "codeium.blink", async = true },
	},
}

local keymap = {
	preset = "default",
	["<CR>"] = { "accept", "fallback" },
}

local completion = {
	documentation = {
		auto_show = true,
		auto_show_delay_ms = 1000,
		window = {
			border = "rounded",
		},
	},
	list = {
		selection = {
			preselect = false,
			auto_insert = false,
		},
	},
	menu = {
		border = "rounded",
		draw = {
			columns = {
				{ "label", "label_description", gap = 1 },
				{ "kind_icon", "kind", gap = 1 },
				{ "source_name" },
			},
			components = {
				source_name = {
					ellipsis = false,
					text = function(ctx)
						return "[" .. ctx.source_name .. "]"
					end,
				},
			},
		},
	},
}

return {
	"saghen/blink.cmp",
	version = "1.*",
	config = function()
		require("blink.cmp").setup({
			cmdline = cmdline,
			sources = sources,
			keymap = keymap,
			completion = completion,
		})
	end,
}
