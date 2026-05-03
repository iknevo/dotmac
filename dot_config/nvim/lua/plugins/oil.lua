return {
  "stevearc/oil.nvim",
  enabled = false,
  opts = {},
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
      },
      win_options = {
        wrap = true,
        winblend = 0,
      },
      keymaps = {
        -- ["h"] = { "actions.parent", mode = "n" },
        -- ["l"] = { "actions.select", mode = "n" },
        ["q"] = { "actions.close", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["."] = { "actions.toggle_hidden", mode = "n" },
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open file explorer" })
  end,
}
