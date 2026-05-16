return {
  "dmmulroy/ts-error-translator.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("ts-error-translator").setup()
  end,
}
