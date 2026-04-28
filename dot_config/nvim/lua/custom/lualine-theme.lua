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
      b = { fg = colors.gray, bg = colors.black },
      c = { fg = colors.gray, bg = colors.black },
    },

    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray, bg = colors.black },
      c = { fg = colors.gray, bg = colors.black },
    },

    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray, bg = colors.black },
      c = { fg = colors.gray, bg = colors.black },
    },

    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray, bg = colors.black },
      c = { fg = colors.gray, bg = colors.black },
    },

    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray, bg = colors.black },
      c = { fg = colors.gray, bg = colors.black },
    },

    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray, bg = colors.black },
      c = { fg = colors.gray, bg = colors.black },
    },
  }
end

return M
