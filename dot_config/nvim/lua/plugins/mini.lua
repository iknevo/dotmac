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
    config = function(_, opts)
      LazyVim.mini.pairs(opts)
    end,
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
    {
      "nvim-mini/mini.surround",
      keys = function(_, keys)
        local opts = LazyVim.opts("mini.surround")
        local mappings = {
          { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "x" } },
          { opts.mappings.delete, desc = "Delete Surrounding" },
          { opts.mappings.find, desc = "Find Right Surrounding" },
          { opts.mappings.find_left, desc = "Find Left Surrounding" },
          { opts.mappings.highlight, desc = "Highlight Surrounding" },
          { opts.mappings.replace, desc = "Replace Surrounding" },
          { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
        }
        mappings = vim.tbl_filter(function(m)
          return m[1] and #m[1] > 0
        end, mappings)
        return vim.list_extend(mappings, keys)
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
  },
}
