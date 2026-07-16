return {
  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },
  {
    "nvim-mini/mini.move",
    event = "VeryLazy",
    opts = {
      mappings = {
        left = "H",
        right = "L",
        down = "J",
        up = "K",

        line_left = "",
        line_right = "",
        line_down = "",
        line_up = "",
      },
    },
  },
  {
    "nvim-mini/mini.surround",
    keys = function()
      local mappings = {
        { "gsa", desc = "Add Surrounding", mode = { "n", "x" } },
        { "gsd", desc = "Delete Surrounding" },
        { "gsf", desc = "Find Right Surrounding" },
        { "gsF", desc = "Find Left Surrounding" },
        { "gsh", desc = "Highlight Surrounding" },
        { "gsr", desc = "Replace Surrounding" },
        { "gsn", desc = "Update `MiniSurround.config.n_lines`" },
      }
      return vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
    end,
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  { "nvim-mini/mini.ai", version = "*" },
}
