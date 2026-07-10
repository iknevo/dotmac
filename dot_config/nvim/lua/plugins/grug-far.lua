return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	opts = {},
	keys = {
		{
			"<leader>sr",
			function()
				require("grug-far").open()
			end,
			desc = "Search and Replace (grug-far)",
		},
		{
			"<leader>sR",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			desc = "Search and Replace word under cursor",
		},
	},
}
