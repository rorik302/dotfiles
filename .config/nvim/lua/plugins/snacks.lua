local layouts = {
	vertical_layout = {
		layout = {
			backdrop = true,
			width = 0.5,
			min_width = 80,
			height = 0.7,
			min_height = 30,
			box = "vertical",
			border = "rounded",
			title = "{title} {live} {flags}",
			title_pos = "center",
			{ win = "input", height = 1, border = "bottom" },
			{ win = "list", height = 0.3, border = "none" },
			{ win = "preview", title = "{preview}", border = "top" },
		},
	},
}

vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Buffer: Delete" })
vim.keymap.set("n", "<leader>bD", function()
	Snacks.bufdelete.all()
end, { desc = "Buffer: Delete All" })
vim.keymap.set("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Buffer: Delete Other" })

vim.keymap.set("n", "<leader>dr", function()
	Snacks.debug.run()
end, { desc = "Debug: Run" })

vim.keymap.set("n", "<leader>ee", function()
	Snacks.explorer({ auto_close = true })
end, { desc = "Explorer: Open" })

vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Picker: Find File" })
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Picker: Find Buffer" })
vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.colorschemes()
end, { desc = "Picker: Find Colorscheme" })
vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "Picker: Find Grep" })
vim.keymap.set("n", "<leader>fi", function()
	Snacks.picker.icons()
end, { desc = "Picker: Find Icon" })
vim.keymap.set("n", "<leader>fk", function()
	Snacks.picker.keymaps()
end, { desc = "Picker: Find Keymap" })
vim.keymap.set("n", "<leader>fn", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Picker: Find Neovim Config" })
vim.keymap.set("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "Picker: Find Project" })
vim.keymap.set("n", "<leader>fL", function()
	Snacks.picker.lines()
end, { desc = "Picker: Find Line" })
vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.registers()
end, { desc = "Picker: Find Register" })
vim.keymap.set("n", "<leader>fu", function()
	Snacks.picker.undo()
end, { desc = "Picker: Find Undo" })

vim.keymap.set("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Git: Branches" })
vim.keymap.set("n", "<leader>gB", function()
	Snacks.git.blame_line()
end, { desc = "Git: Blame Line" })
vim.keymap.set("n", "<leader>gF", function()
	Snacks.lazygit.log_file()
end, { desc = "Git: Open File Logs" })
vim.keymap.set("n", "<leader>gl", function()
	Snacks.lazygit.open()
end, { desc = "Git: Open Lazygit" })
vim.keymap.set("n", "<leader>gL", function()
	Snacks.picker.git_log()
end, { desc = "Git: Open Logs" })
vim.keymap.set("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git: Status" })

vim.keymap.set("n", "gO", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP: Symbols" })
vim.keymap.set("n", "gW", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP: Workspace Symbols" })

vim.keymap.set("n", "<leader>nh", function()
	Snacks.notifier.hide()
end, { desc = "Notification: Hide" })
vim.keymap.set("n", "<leader>nH", function()
	Snacks.picker.notifications()
end, { desc = "Notification: Show History" })

vim.keymap.set("n", "<leader>tT", function()
	Snacks.terminal.toggle()
end, { desc = "Terminal: Toggle" })

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		_G.dd = function(...)
			Snacks.debug.inspect(...)
		end
		_G.bt = function()
			Snacks.debug.backtrace()
		end

		vim.print = _G.dd

		Snacks.toggle.diagnostics():map("<leader>ud")
		Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle.indent():map("<leader>ui")
		Snacks.toggle.treesitter():map("<leader>ut")
		Snacks.toggle.option("relativenumber"):map("<leader>ur")
		Snacks.toggle.option("wrap"):map("<leader>uw")
		Snacks.toggle({
			name = "Autoformat",
			get = function()
				return vim.g.autoformat
			end,
			set = function()
				if vim.g.autoformat then
					vim.cmd("Guard disable-fmt")
					vim.g.autoformat = false
				else
					vim.cmd("Guard enable-fmt")
					vim.g.autoformat = true
				end
			end,
		}):map("<leader>uf")
	end,
})

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("snacks").setup({
			explorer = {
				enabled = true,
				replace_netrw = true,
				layout = {
					preset = "sidebar",
				},
			},
			notifier = {
				enabled = true,
				timeout = 10000,
			},
			picker = {
				enabled = true,
				layouts = layouts,
				layout = "vertical_layout",
				win = {
					input = {
						keys = {
							["f"] = { "flash" },
							["<a-f>"] = { "flash", mode = { "n", "i" } },
						},
					},
				},
				actions = {
					flash = function(picker)
						require("flash").jump({
							pattern = "^",
							label = { after = { 0, 0 } },
							search = {
								mode = "search",
								exclude = {
									function(win)
										return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
									end,
								},
							},
							action = function(match)
								local idx = picker.list:row2idx(match.pos[1])
								picker.list:_move(idx, true, true)
							end,
						})
					end,
				},
			},
			scroll = {
				enabled = true,
			},
			styles = {
				notification = {
					wo = {
						wrap = true,
					},
				},
				notification_history = {
					wo = {
						wrap = true,
					},
				},
			},
			terminal = {
				enabled = true,
			},
			toggle = {
				enabled = true,
			},
		})
	end,
}
