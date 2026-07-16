return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local theme = require("custom.lualine-theme").theme()

    require("lualine").setup({
      options = {
        theme = theme,
        -- theme = "auto",
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
        lualine_x = {
          {
            function()
              local ok, noice = pcall(require, "noice")
              return ok and noice.statusline and noice.statusline.message() or ""
            end,
            cond = function()
              local ok, noice = pcall(require, "noice")
              return ok and noice.statusline and noice.statusline.has("message") or false
            end,
          },
          {
            function()
              local ok, noice = pcall(require, "noice")
              return ok and noice.statusline and noice.statusline.command() or ""
            end,
            cond = function()
              local ok, noice = pcall(require, "noice")
              return ok and noice.statusline and noice.statusline.has("command") or false
            end,
          },
          {
            function()
              local ok, noice = pcall(require, "noice")
              return ok and noice.statusline and noice.statusline.mode() or ""
            end,
            cond = function()
              local ok, noice = pcall(require, "noice")
              return ok and noice.statusline and noice.statusline.has("mode") or false
            end,
          },
          "filetype",
        },
        lualine_y = { "selectioncount" },
        lualine_z = { "searchcount" },
      },
    })
  end,
}
