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
        astro = { "prettier", "prettierd" },
        javascript = { "prettier", "prettierd" },
        javascriptreact = { "prettier", "prettierd" },
        typescript = { "prettier", "prettierd" },
        typescriptreact = { "prettier", "prettierd" },
        json = { "prettier", "prettierd" },
        jsonc = { "prettier", "prettierd" },
        css = { "prettier", "prettierd" },
        graphql = { "prettier", "prettierd" },
        html = { "prettier", "prettierd" },
        less = { "prettier", "prettierd" },
        scss = { "prettier", "prettierd" },
        vue = { "prettier", "prettierd" },
        yaml = { "prettier", "prettierd" },
      },
    },
  },
}
