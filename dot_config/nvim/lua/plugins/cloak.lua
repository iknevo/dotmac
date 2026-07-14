return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
			highlight_group = "Comment",
			patterns = {
				{
					file_pattern = {
						".env*",
						"wrangler.toml",
						".dev.vars",
					},
					cloak_pattern = "=.+",
				},
			},
		})
		vim.keymap.set("n", "<leader>cs", "<cmd>CloakToggle<CR>", {
			desc = "Toggle Secrets",
			silent = true,
		})
	end,
}
