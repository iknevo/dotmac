return {
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set({ "n", "v" }, "ge", require("nvim-emmet").wrap_with_abbreviation, { desc = "Emmet abbreviation" })
  end,
}
