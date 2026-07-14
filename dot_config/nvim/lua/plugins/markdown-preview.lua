return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_auto_close = 1
		vim.g.mkdp_refresh_slow = 0
	end,
	config = function()
		vim.api.nvim_buf_create_user_command(0, "MarkdownPreview", function()
			vim.cmd("call mkdp#util#open_preview_page()")
		end, { force = true })
		vim.api.nvim_buf_create_user_command(0, "MarkdownPreviewStop", function()
			vim.cmd("call mkdp#util#stop_preview()")
		end, { force = true })
		vim.api.nvim_buf_create_user_command(0, "MarkdownPreviewToggle", function()
			vim.cmd("call mkdp#util#toggle_preview()")
		end, { force = true })
	end,
	keys = {
		{ "<leader>cp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview Toggle" },
	},
}
