return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>ft",
      function()
        Snacks.terminal()
      end,
      desc = "Terminal (cwd)",
    },

    {
      "<leader>fT",
      function()
        Snacks.terminal(nil, { cwd = LazyVim.root() })
      end,
      desc = "Terminal (Root Dir)",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    { "<leader>E", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
  },
  opts = {
    image = {},
    input = {},
    statuscolumn = {},
    picker = {
      sources = {
        files = {
          hidden = false,
          ignored = false,
          exclude = { "node_modules", "dist", "build", ".next" },
        },
        grep = {
          hidden = false,
          ignored = true,
          exclude = { "node_modules", ".git", "dist", "build", ".next" },
        },
        explorer = {
          show__modified = true,
          replace_netrw = true,
          trash = true,
          -- auto_close = true,
          hidden = false,
          ignored = false,
          -- exclude = { "node_modules" },
          -- layout = { layout = { position = "left", width = 35 } },
          -- exclude = { "node_modules", ".git", "dist", "build", ".next" },
          layout = {
            layout = {
              box = "vertical",
              width = 35,
              position = "left",
              {
                win = "input",
                height = 1,
                border = "bottom",
              },
              {
                win = "list",
                border = "none",
              },
              {
                win = "preview",
                border = "top",
                height = 0.4,
                title = "{preview}",
              },
            },
          },
        },
      },
      icons = {
        modified = "●",
        readonly = "",
        git = {
          -- staged = "●",
          -- added = "A",
          -- deleted = "D",
          -- ignored = "",
          -- modified = "M",
          -- renamed = "R",
          -- untracked = "U",
          added = "",
          modified = "",
          -- modified = "",
          deleted = "",
          renamed = "󰁕",
          untracked = "",
          -- unstaged = "",
          unstaged = "",
          staged = "",
          conflict = "",
          ignored = "",
        },
      },
    },
    dashboard = {
      enabled = false,
      preset = {
        header = [[
          ███╗   ██╗███████╗██╗   ██╗ ██████╗
          ████╗  ██║██╔════╝██║   ██║██╔═══██╗
          ██╔██╗ ██║█████╗  ██║   ██║██║   ██║
          ██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║   ██║
          ██║ ╚████║███████╗ ╚████╔╝ ╚██████╔╝
          ╚═╝  ╚═══╝╚══════╝  ╚═══╝   ╚═════╝
      ]],
      },
    },
  },
}
