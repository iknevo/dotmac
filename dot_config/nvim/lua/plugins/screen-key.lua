return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  opts = {
    win_opts = {
      title = "",
    },
  },
  keys = {
    {
      "<leader>uk",
      function()
        require("screenkey").toggle()
      end,
      desc = "Toggle Screenkey",
    },
  },
}
