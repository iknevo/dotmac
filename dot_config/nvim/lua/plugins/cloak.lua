return {
  "laytan/cloak.nvim",
  config = function()
    require("cloak").setup({
      enabled = true,
      cloak_character = "*",
      highlight_group = "Comment",
      patterns = {
        {
          file_pattern = {
            ".env*",
            "wrangler.toml",
            ".dev.vars",
          },
          cloak_pattern = "=.+",
        },
      },
    })
    vim.keymap.set("n", "<leader>cet", "<cmd>CloakToggle<CR>", {
      desc = "Toggle cloak",
      silent = true,
    })
  end,
}
