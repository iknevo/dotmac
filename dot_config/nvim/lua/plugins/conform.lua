return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = false })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = false,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			svelte = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			scss = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			graphql = { "prettierd", "prettier" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--trailing-comma", "none", "--print-width", "100" },
			},
		},
	},
}
