return {
  "vuki656/package-info.nvim",
  ft = "json",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local package_info = require("package-info")

    package_info.setup({
      autostart = true,
      hide_up_to_date = true,
      notifications = false,
      icons = {
        enable = true,
        style = {
          up_to_date = "|  ",
          outdated = "|  ",
          invalid = "|  ",
        },
      },
    })

    local opts = { silent = true, noremap = true }

    -- Show dependency versions
    vim.keymap.set("n", "<leader>js", package_info.show, vim.tbl_extend("force", opts, { desc = "Show versions" }))

    -- Hide dependency versions
    vim.keymap.set("n", "<leader>jh", package_info.hide, vim.tbl_extend("force", opts, { desc = "Hide versions" }))

    -- Toggle dependency versions
    vim.keymap.set("n", "<leader>jt", package_info.toggle, vim.tbl_extend("force", opts, { desc = "Toggle versions" }))

    -- Update dependency on the line
    vim.keymap.set(
      "n",
      "<leader>ju",
      package_info.update,
      vim.tbl_extend("force", opts, { desc = "Update dependency" })
    )

    -- Delete dependency on the line
    vim.keymap.set(
      "n",
      "<leader>jd",
      package_info.delete,
      vim.tbl_extend("force", opts, { desc = "Delete dependency" })
    )

    -- Install a new dependency
    vim.keymap.set(
      "n",
      "<leader>ji",
      package_info.install,
      vim.tbl_extend("force", opts, { desc = "Install dependency" })
    )

    -- Install a different dependency version
    vim.keymap.set(
      "n",
      "<leader>jc",
      package_info.change_version,
      vim.tbl_extend("force", opts, { desc = "Change version" })
    )
  end,
}
