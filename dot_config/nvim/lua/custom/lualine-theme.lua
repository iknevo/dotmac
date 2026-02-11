local M = {}

M.theme = function()
  local colors = {
    black = "#000000",
    white = "#ffffff",
    gray = "#a5b5b5",
    darkgray = "#16161d",

    -- Mode
    normal = "#7e9cd8",
    insert = "#98bb6c",
    visual = "#ffa066",
    replace = "#e46876",
    command = "#e6c384",
  }

  return {
    inactive = {
      a = { fg = colors.gray, gui = "bold" },
      b = { fg = colors.gray },
      c = { fg = colors.gray },
    },

    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray },
      c = { fg = colors.gray },
    },

    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray },
      c = { fg = colors.gray },
    },

    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray },
      c = { fg = colors.gray },
    },

    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray },
      c = { fg = colors.gray },
    },

    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray },
      c = { fg = colors.gray },
    },
  }
end

return M
