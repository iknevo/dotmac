return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	keys = {
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader><space>",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent({ filter = { cwd = true } })
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fs",
			function()
				Snacks.scratch()
			end,
			desc = "Scratch Buffer",
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.buffers({ filter = { name = "scratch" } })
			end,
			desc = "Scratch Buffers List",
		},

		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues (open)",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "GitHub Issues (all)",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			"<leader>gP",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},

		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undotree",
		},
		-- buffer
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffers",
		},
		{
			"<leader>ba",
			function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					if vim.api.nvim_buf_is_valid(buf) then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
				vim.cmd("enew")
			end,
			desc = "Delete All Buffers",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>t",
			function()
				Snacks.terminal()
			end,
			desc = "Terminal",
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		local group = vim.api.nvim_create_augroup("SnacksExplorerBufModified", { clear = true })
		local refresh = require("snacks.util").debounce(function()
			for _, picker in ipairs(require("snacks.picker").get({ source = "explorer", tab = false }) or {}) do
				if picker and not picker.closed then
					picker.list:update({ force = true })
				end
			end
		end, { ms = 50 })

		vim.api.nvim_create_autocmd({ "BufModifiedSet", "BufDelete" }, {
			group = group,
			callback = function()
				refresh()
			end,
		})
	end,
	opts = function()
		return {
			indent = {
				enabled = true,
			},
			scroll = {
				enabled = false,
			},
			image = {},
			input = {},
			statuscolumn = {},
			explorer = {
				enabled = true,
				replace_netrw = true,
			},
			picker = {
				sources = {
					files = {
						hidden = false,
						ignored = false,
						exclude = { "node_modules", "dist", "build", ".next" },
					},
					grep = {
						hidden = false,
						ignored = true,
						exclude = { "node_modules", ".git", "dist", "build", ".next" },
					},
					explorer = {
						show__modified = true,
						trash = true,
						hidden = false,
						ignored = false,
						format = function(item, picker)
							local fmt = require("snacks.picker.format")
							local ret = fmt.file(item, picker)
							if not item.dir and item.file then
								for _, buf in ipairs(vim.api.nvim_list_bufs()) do
									if vim.api.nvim_buf_is_loaded(buf) then
										local name = vim.api.nvim_buf_get_name(buf)
										if
											name ~= ""
											and vim.fn.fnamemodify(name, ":p")
												== vim.fn.fnamemodify(item.file, ":p")
										then
											if vim.bo[buf].modified then
												ret[#ret + 1] = {
													col = 0,
													virt_text = { { "●", "SnacksPickerBufModified" }, { " " } },
													virt_text_pos = "right_align",
													hl_mode = "combine",
												}
											end
											break
										end
									end
								end
							end
							return ret
						end,
						layout = {
							layout = {
								box = "vertical",
								width = 35,
								position = "left",
								{
									win = "input",
									height = 1,
									border = "bottom",
								},
								{
									win = "list",
									border = "none",
								},
								{
									win = "preview",
									border = "top",
									height = 0.4,
									title = "{preview}",
								},
							},
						},
					},
				},
				icons = {
					modified = "●",
					readonly = "",
					git = {
						added = "",
						modified = "",
						deleted = "",
						renamed = "󰁕",
						untracked = "",
						unstaged = "",
						staged = "",
						conflict = "",
						ignored = "",
					},
				},
				actions = {
					trouble_open = function(...)
						return require("trouble.sources.snacks").actions.trouble_open.action(...)
					end,
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
				win = {
					input = {
						keys = {
							["<a-t>"] = { "trouble_open", mode = { "n", "i" } },
							["<a-s>"] = { "flash", mode = { "n", "i" } },
							["s"] = { "flash" },
						},
					},
				},
			},
			dashboard = {
				enabled = true,
				preset = {
					header = [[

⠀⠀⠀⠀⠀⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠞⣿⠀⠀⠀⠀
⣀⣀⣀⣀⣀⣸⣿⣿⣷⣄⣀⣄⣄⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⡴⠋⠀⣸⣧⣤⣤⣤⣤
⣿⠉⣉⣉⣉⣉⣹⣿⣿⣿⣿⣄⣀⣀⣀⣈⣉⣉⣉⣉⠉⢁⣁⣀⣀⣀⣉⣉⣉⣉⣉⡽⠋⠀⠀⣠⣟⣀⣀⣀⠀⣿
⣿⠀⡿⣿⣯⡉⠉⠙⣿⣿⣿⣿⣯⡉⠉⠉⠉⠉⠉⣿⠀⢸⡏⠉⠉⠉⠉⠉⢉⡽⠋⠀⠀⢀⣴⠋⣩⡿⢻⣿⠀⣿
⣿⠀⡇⠘⣿⣿⣷⣄⡈⠛⢿⣿⣿⡇⣶⣄⠀⠀⠀⣿⠀⢸⡇⠀⠀⠀⢀⡴⢻⡇⠀⢀⣴⢟⡵⠟⠁⢀⡾⢸⠀⣿
⣿⠀⡇⠀⠹⣿⣿⣿⣿⣶⣄⡙⢿⡇⣿⣿⣷⣄⠀⣿⠀⢸⡇⠀⢀⡴⠋⠀⢸⣇⣴⡿⠟⠉⠀⠀⢀⣼⠃⢸⡀⣿
⣿⠀⣷⣶⣦⣌⡛⢿⣿⣿⣿⣧⢰⣅⠻⣿⣿⣿⣷⣿⠀⢸⣇⠴⠋⠀⠀⣠⣾⠟⣿⠇⠀⢀⣠⣾⠿⠓⠋⢩⡇⣿
⣿⠀⡟⢿⣿⣿⣿⣶⣌⡻⢿⣿⣸⣿⣷⣌⠻⣿⣿⣿⣧⣾⡇⠀⢀⣴⣾⠟⠁⢰⣿⣠⣴⡿⠛⠁⠀⠀⣠⢿⠀⣿
⣿⠀⣇⠀⠙⠿⣿⣿⣿⣿⣇⢉⡙⢿⣿⣿⣧⠈⣹⠟⠁⣿⣇⣴⣿⠟⠁⠀⣠⣾⢿⣿⠉⠀⠀⣀⣴⣾⡧⣼⠀⣿
⣿⠀⣿⣿⣶⣦⣌⠛⠿⣿⣿⡜⣿⣦⡻⠋⣡⠎⠀⠀⢀⣿⣿⡏⠁⠀⣠⡾⠟⠁⣼⡇⣀⣴⣾⠿⠛⠁⢀⣿⡅⣿
⣿⠀⣿⣿⣿⣿⣿⣿⣦⡈⠙⠃⠹⣿⡿⢸⠃⠀⣠⣾⠿⢋⣿⠃⣠⡾⠋⠀⠀⣠⣿⣿⡿⠋⠀⠀⠀⢀⡞⢹⠂⣿
⣿⠀⠿⠿⠿⢿⣿⣿⣿⣷⡌⢿⣦⣽⣷⡏⢀⣴⠟⠁⠀⢸⣿⡿⠋⠀⠀⣠⡾⠟⢩⣿⠃⠀⠀⢀⡴⣛⣛⣿⡁⣿
⣿⠀⣰⣶⣦⣤⣙⣻⣿⣿⣷⡘⣿⣿⣿⣷⡿⠋⠀⢀⣴⢿⣿⠀⢀⣴⠾⠋⠀⢀⣿⡏⣠⣴⣾⡿⠟⠉⢀⣾⠀⣿
⣿⠀⡟⢻⣿⣿⣿⣿⣭⣉⠙⠃⠘⢿⣿⡏⠀⢀⣴⠟⠁⣸⣿⣾⡟⠁⠀⠀⣀⣼⣿⣿⡿⠛⠁⠀⠀⢠⡞⢹⠀⣿
⣿⠀⡇⠀⠙⢿⣿⣿⣿⣿⣆⢲⣤⣄⣹⢁⣴⠟⠁⢀⣴⠟⢻⣿⠀⢀⣤⣾⡿⠛⣹⡟⠀⠀⢀⣠⣴⣋⣀⢸⠀⣿
⣿⠀⣧⣴⣦⣤⣈⡙⠻⣿⣿⡌⣿⣿⣿⡿⠋⢀⣴⠟⠃⢀⣿⣷⣾⠿⠋⠁⠀⢠⣿⣣⣴⠾⠛⠋⠉⣹⠏⢸⡄⣿
⣿⠀⣿⠈⠻⣿⣿⣿⣷⣦⡈⠁⠘⠻⣿⠀⣠⡾⠃⢀⣴⣿⣿⡟⠁⠀⣀⣴⣾⣿⣿⠟⠁⠀⠀⢀⡼⠃⠀⢸⠆⣿
⣿⠀⣿⠀⠀⠈⠻⣿⣿⣿⣿⡌⢿⣷⣿⡾⠋⢀⣴⠟⠉⢸⣿⣠⣶⡿⠟⠛⠉⣼⡏⢀⣠⣤⣶⠿⠶⣶⠀⢸⡀⣿
⣿⠀⣿⠰⣿⣿⣶⣦⣌⡉⠛⠻⠈⢿⡏⢀⡴⠟⠁⣠⣴⣿⣿⡟⠉⠀⠀⣀⣸⣿⣾⠿⠛⠉⠀⣀⡾⠃⠀⢸⠀⣿
⣿⠀⣿⠀⠈⠛⢿⣿⣿⣿⣿⣦⢠⣼⡷⢋⣠⣶⡿⠟⠋⣽⣏⣀⣤⣶⣿⠿⢻⣿⠁⠀⣀⣤⠾⠋⠀⠀⠀⢸⡀⣿
⣿⠀⡇⠀⠀⠀⢠⣬⣉⡛⠿⢿⣧⣹⣶⡿⠛⠉⢀⣠⣴⣿⠿⠟⠋⠁⠀⣠⣿⣷⠶⠛⠛⢋⡿⠁⠀⠀⠀⢸⡇⣿
⣿⠀⢷⣄⡀⠀⠈⠻⣿⣿⣿⣶⣦⡟⠉⣀⣤⠶⠛⢉⣿⠇⣀⣠⡴⠶⠛⣽⡟⠀⠀⢀⣠⠟⠀⠀⠀⣀⣤⡾⠃⣿
⠻⢦⣄⡈⠛⠶⣤⣀⠈⠙⠛⠿⣿⡷⠟⠋⢀⣠⣴⣿⡿⠛⠉⠁⣀⣠⣾⣿⣴⡶⠿⢯⣤⣀⣤⡶⠟⠋⣁⣤⡶⠟
⠀⠀⠉⠻⢶⣤⣈⠙⠳⣿⣿⣷⣏⣤⣴⠾⠛⠉⣠⣿⣣⣴⡶⠿⣻⡿⠋⠉⠀⠀⢀⣴⠿⠛⢁⣠⡴⠞⠋⠁⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠷⣦⣄⣽⠿⠋⠉⠀⢀⣠⣾⣿⣯⣭⣤⣤⣾⣿⣤⣤⣤⣶⣾⣿⣤⣴⠾⠋⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⣀⣤⡶⠛⠻⣯⣄⣿⠀⠀⣿⣩⣴⠾⠛⢉⣬⣿⠿⠿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣴⣯⡵⠞⠋⠁⠈⠛⠷⣦⣄⠉⠛⠀⠀⠛⢉⣠⣴⠾⠛⠉⠀⠀⠀⠀⠈⠙⠻⠦⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢶⣤⣴⡾⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
				},
				sections = {
					{ section = "header" },
					-- { section = "keys", gap = 1, padding = 1 },
					-- { section = "startup" },
				},
			},
		}
	end,
}
