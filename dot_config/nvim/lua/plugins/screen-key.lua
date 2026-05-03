return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  keys = {
    {
      "<leader>kk",
      function()
        require("screenkey").toggle()
      end,
      desc = "Toggle Screenkey",
    },
  },
}
