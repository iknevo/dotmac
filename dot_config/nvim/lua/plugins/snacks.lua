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
	},
	config = function(_, opts)
		require("snacks").setup(opts)
	end,
	opts = function()
		return {
			indent = {
				enabled = false,
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
███╗   ██╗███████╗██╗   ██╗ ██████╗ 
████╗  ██║██╔════╝██║   ██║██╔═══██╗
██╔██╗ ██║█████╗  ██║   ██║██║   ██║
██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║   ██║
██║ ╚████║███████╗ ╚████╔╝ ╚██████╔╝
╚═╝  ╚═══╝╚══════╝  ╚═══╝   ╚═════╝ 
				    ]],
				},
			},
		}
	end,
}
