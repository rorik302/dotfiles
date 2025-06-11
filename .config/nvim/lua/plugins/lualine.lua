local branch = {
	"branch",
	icon = "",
	color = { fg = "#ffcc66", gui = "bold" },
}
local diff = {
	"diff",
	symbols = { added = " ", modified = " ", removed = " " },
	diff_color = {
		added = { fg = "#d5ff80" },
		modified = { fg = "#ffd173" },
		removed = { fg = "#ff6666" },
	},
}
local diagnostics = {
	"diagnostic",
	sources = { "nvim_diagnostic" },
	symbols = {
		error = " ",
		warn = " ",
		info = " ",
		hint = " ",
	},
	diagnostics_color = {
		error = { fg = "#ff6666" },
		warn = { fg = "#ffd173" },
		info = { fg = "#dfbfff" },
		hint = { fg = "#80bfff" },
	},
}
local filename = {
	"filename",
	file_status = true,
	newfile_status = true,
	symbols = {
		modified = " ",
		readonly = " ",
		unnamed = "[No Name]",
		newfile = "[New File]",
	},
	color = { fg = "#cccac2" },
	fmt = function(name, _)
		local icon
		local ok, devicons = pcall(require, "nvim-web-devicons")
		if ok then
			icon = devicons.get_icon(vim.fn.expand("%:t"))
		else
			icon = " "
		end
		return icon .. " " .. name
	end,
}
local lsp_status = {
	"lsp_status",
	color = { fg = "#cccac2" },
}

local macro_recording = {
	function()
		local recording = vim.fn.reg_recording()
		if recording ~= "" then
			return "󰑊 Recording @" .. recording
		else
			return ""
		end
	end,
	color = { fg = "#ff6666" },
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "ayu_mirage",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diff, diagnostics },
				lualine_c = {
					lsp_status,
					macro_recording,
				},

				lualine_x = { filename },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
