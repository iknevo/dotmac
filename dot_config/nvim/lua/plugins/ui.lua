return {
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = { "┆" },
      virtcolumn = "100",
      highlight = { "NonText" },
    },
  },
  {
    "j-hui/fidget.nvim",
    enabled = false,
    opts = {
      notification = {
        window = {
          winblend = 0,
          border = "rounded",
        },
      },
    },
  },
  {
    "b0o/incline.nvim",
    enabled = true,
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    config = function()
      require("incline").setup({
        hide = {
          only_win = false,
        },
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          local filename = vim.fn.fnamemodify(bufname, ":t")
          if filename == "" then
            filename = "[No Name]"
          end

          local icon, icon_hl = require("mini.icons").get("file", filename)
          icon = icon or ""
          local icon_color = icon_hl and vim.api.nvim_get_hl(0, { name = icon_hl }).fg or nil

          local modified = vim.bo[props.buf].modified

          return {
            { " ", icon, " ", guifg = icon_color },
            { filename, gui = modified and "bold" or "none" },
            modified and { " ●", guifg = "#ff9e64" } or "",
            " ",
          }
        end,
      })
    end,
  },
}
