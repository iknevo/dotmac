return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline",
			format = {
				cmdline = { icon = ":" },
				search_down = { icon = "/", kind = "search" },
				search_up = { icon = "?", kind = "search" },
			},
		},
		messages = {
			enabled = true,
			view = "mini",
		},
		popupmenu = {
			enabled = true,
			backend = "nui",
		},
		notify = {
			enabled = false,
		},
		commands = {
			history = {
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show" },
						{ event = "lsp", kind = "message" },
					},
				},
			},
		},
		views = {
			popup = {
				position = { row = 1, col = "50%" },
				size = { width = 60, height = 15 },
			},
		},
		presets = {
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
		lsp = {
			progress = { enabled = false, view = "mini" },
		},
		routes = {
			{
				view = "mini",
				filter = {
					event = "msg_showmode",
					any = {
						{ find = "recording" },
					},
				},
			},
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "msg_show",
					find = "lines",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			},
		},
	},
	keys = {
		{
			"<leader>n",
			function()
				require("noice").cmd("history")
			end,
			desc = "Noice History",
		},
	},
}
