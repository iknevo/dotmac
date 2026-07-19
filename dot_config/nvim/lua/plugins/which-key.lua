return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "helix",
    defaults = {},
    spec = {
      {
        mode = { "n", "x" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>j", group = "package" },
        { "<leader>n", group = "noice" },
        { "<leader>q", group = "quit/session" },
        { "<leader>R", group = "rest" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        { "gx", desc = "Open with system app" },
        {
          "<leader>m",
          group = "multi-cursor",
          expand = function()
            return {
              { "i", desc = "Insert mode" },
              { "a", desc = "Append mode" },
              { "e", desc = "Extend mode" },
              { "c", desc = "Change mode" },
              { "n", desc = "Next match" },
              { "N", desc = "Prev match" },
              { "q", desc = "Skip current" },
              { "Q", desc = "Skip prev" },
              { "r", desc = "Replace from clipboard" },
              { "p", desc = "Put before" },
              { "P", desc = "Put after" },
              { "y", desc = "Yank" },
              { "d", desc = "Delete" },
              { "<Esc>", desc = "Exit" },
            }
          end,
        },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    {
      "<c-w><space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
