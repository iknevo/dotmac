return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
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
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    luasnip.filetype_extend("javascript", { "javascriptreact" })
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      formatting = {

        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
          mode = "symbol",
          menu = {
            nvim_lsp = "[LSP]",
            luasnip = "",
            path = "",
          },
          before = function(entry, item)
            return require("tailwindcss-colorizer-cmp").formatter(entry, item)
          end,
        }),
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
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          col_offset = -3,
          side_padding = 1,
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
