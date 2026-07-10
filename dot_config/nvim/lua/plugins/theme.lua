return {
  {
    "ribru17/bamboo.nvim",
    priority = 1000,
    opts = {
      style = "multiplex",
      lualine = {
        transparent = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bamboo",
    },
  },
}

-- return {
--   {
--     "kartikp10/noctis.nvim",
--     priority = 1000,
--   },
--   {
--     "folke/snacks.nvim",
--     opts = {
--       lazygit = {
--         -- configure = false,
--         theme = {
--           selectedLineBgColor = { fg = "LineNr", bg = "Comment" },
--         },
--       },
--     },
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "noctis",
--     },
--   },
-- }
