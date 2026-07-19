return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ bufnr = 0 })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      format_on_save = true,
      formatters_by_ft = {
        lua = { "stylua" },
        astro = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        graphql = { "prettier" },
        html = { "prettier" },
        less = { "prettier" },
        scss = { "prettier" },
        vue = { "prettier" },
        yaml = { "prettier" },
      },
    },
  },
}
