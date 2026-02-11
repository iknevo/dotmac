return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "nvim-treesitter/nvim-treesitter",
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  config = function()
    local cmp = require("cmp")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      window = {
        documentation = {
          scrollbar = false,
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
        completion = {
          -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
      -- autocompletion sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Select,
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Select,
        }),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete({}),
      }),
    })
  end,
}
