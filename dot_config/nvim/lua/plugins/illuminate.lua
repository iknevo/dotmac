return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 100,
      min_count_to_highlight = 1,
      under_cursor = true,
    })
  end,
}
