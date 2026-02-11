return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- local theme = require("custom.lualine-theme").theme()

    require("lualine").setup({
      options = {
        icons_enabled = true,
        -- theme = theme,
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_c = {
          {
            "filename",
            symbols = {
              modified = "●",
              readonly = " ",
              unnamed = "[No Name]",
            },
            path = 1,
          },
        },
        lualine_x = { "filetype" },
        lualine_y = { "selectioncount" },
        lualine_z = { "searchcount" },
      },
    })
  end,
}
