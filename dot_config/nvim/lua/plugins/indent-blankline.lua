return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	main = "ibl",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"lazy",
				"mason",
				"neo-tree",
				"notify",
				"snacks_dashboard",
				"snacks_notif",
				"snacks_terminal",
				"snacks_win",
				"trouble",
			},
		},
	},
}
