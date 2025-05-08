return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local snacks = require("snacks")

		snacks.setup({
			bigfile = {
				enabled = true,
				notify = true,
				size = 1.5 * 1024 * 1024,
				line_length = 1000,
			},
			dashboard = {
				enabled = true,
				example = "advanced",
			},
			indent = {
				enabled = false,
				animate = {
					enabled = true,
					style = "out",
					easing = "linear",
					duration = {
						step = 20,
						total = 1000,
					},
				},
				scope = {
					enabled = true,
					priority = 200,
					char = "│",
					underline = false,
					only_current = true,
				},
			},
			notifier = {
				enabled = true,
				level = "WARN",
			},
			picker = {
				enabled = true,
				ui_select = true,
			},
			statuscolumn = {
				enabled = true,
				folds = {
					open = true,
					git_hl = true,
				},
			},
		})

		local map = require("utils").map

		map("<leader>ee", function()
			snacks.explorer()
		end, { desc = "Snacks: Explorer" })

		-- Picker
		map("<leader>ff", function()
			snacks.picker.files()
		end, { desc = "Picker: Find File" })
		map("<leader>fn", function()
			snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Picker: Find Neovim File" })
		map("<leader>fg", function()
			snacks.picker.grep()
		end, { desc = "Picker: Find Grep" })
		map("<leader>fb", function()
			snacks.picker.buffers()
		end, { desc = "Picker: Find Buffer" })
		map("<leader>fk", function()
			snacks.picker.keymaps()
		end, { desc = "Picker: Find Keymap" })
		map("<leader>fp", function()
			snacks.picker.projects()
		end, { desc = "Picker: Find Project" })
		map("<leader>fc", function()
			snacks.picker.commands()
		end, { desc = "Picker: Find Command" })
		map("<leader>fN", function()
			snacks.picker.notifications()
		end, { desc = "Picker: Notification History" })
		map("<leader>fC", function()
			snacks.picker.command_history()
		end, { desc = "Picker: Command History" })
		map("<leader>fh", function()
			snacks.picker.help()
		end, { desc = "Picker: Find Help" })
		map("<leader>fu", function()
			snacks.picker.undo()
		end, { desc = "Picker: Find Undo" })
		map("<leader>fi", function()
			snacks.picker.icons()
		end, { desc = "Picker: Find Icon" })
		map("<leader>fq", function()
			snacks.picker.qflist()
		end, { desc = "Picker: Quickfix list" })

		-- Git
		map("<leader>gs", function()
			snacks.picker.git_status()
		end, { desc = "Git: Status" })
		map("<leader>gS", function()
			snacks.picker.git_stash()
		end, { desc = "Git: Stash" })
		map("<leader>gl", function()
			snacks.lazygit()
		end, { desc = "Git: LazyGit" })
		map("<leader>gL", function()
			snacks.lazygit.log()
		end, { desc = "Git: Log" })
		map("<leader>gb", function()
			snacks.picker.git_branches()
		end, { desc = "Git: Branches" })
		map("<leader>gB", function()
			snacks.git.blame_line()
		end, { desc = "Git: Blame Line" })
		map("<leader>gd", function()
			snacks.picker.git_diff()
		end, { desc = "Git: Diff" })

		-- LSP
		map("gd", function()
			snacks.picker.lsp_definitions()
		end, { desc = "LSP: Goto Definition" })
		map("gD", function()
			snacks.picker.lsp_declarations()
		end, { desc = "LSP: Goto Declaration" })
		map("gr", function()
			snacks.picker.lsp_references()
		end, { desc = "LSP: References" })
		map("gI", function()
			snacks.picker.lsp_implementations()
		end, { desc = "LSP: Goto Implementation" })
		map("gy", function()
			snacks.picker.lsp_type_definitions()
		end, { desc = "LSP: Goto Type Definition" })

		-- Buffers
		map("<leader>bd", function()
			snacks.bufdelete()
		end, { desc = "Buffer: Delete" })
		map("<leader>bD", function()
			snacks.bufdelete.all()
		end, { desc = "Buffer: Delete All" })

		-- Terminal
		map("<leader>tt", function()
			snacks.terminal()
		end, { desc = "Terminal: Toggle" })

		-- Lsp progress
		vim.api.nvim_create_autocmd("LspProgress", {
			---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
			callback = function(ev)
				local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
				vim.notify(vim.lsp.status(), "warn", {
					id = "lsp_progress",
					title = "LSP Progress",
					opts = function(notif)
						notif.icon = ev.data.params.value.kind == "end" and " "
							or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
					end,
				})
			end,
		})
	end,
}
