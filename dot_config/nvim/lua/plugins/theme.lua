return {
  {
    "ribru17/bamboo.nvim",
    priority = 1000,
    opts = {
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
--     "slugbyte/lackluster.nvim",
--     priority = 1000,
--     config = function()
--       require("lackluster").setup({
--         disable_plugin = {},
--         tweak_ui = {
--           disable_undercurl = true,
--           enable_end_of_buffer = true,
--         },
--         tweak_syntax = {
--           comment = require("lackluster").color.gray6,
--           string = require("lackluster").color.orange,
--           string_escape = require("lackluster").color.gray1,
--         },
--         tweak_background = {
--           normal = "#000000",
--           telescope = "#000000",
--           menu = "#000000",
--           popup = "#000000",
--         },
--       })
--     end,
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
--       colorscheme = "lackluster-hack",
--     },
--   },
-- }
