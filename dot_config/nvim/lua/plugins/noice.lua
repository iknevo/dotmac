return {
  "folke/noice.nvim",
  optional = true,
  opts = {
    routes = {
      {
        view = "mini",
        filter = {
          event = "msg_showmode",
          any = {
            { find = "recording" },
          },
        },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "lines",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "Neo%-tree",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
    },
    presets = { inc_rename = true },
    lsp = {
      progress = { enabled = false, view = "mini" },
    },
  },
}
