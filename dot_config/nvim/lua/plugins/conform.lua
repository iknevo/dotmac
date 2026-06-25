return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      prettier = {
        prepend_args = { "--trailing-comma", "es5", "--print-width", "100" },
      },
    },
  },
}
