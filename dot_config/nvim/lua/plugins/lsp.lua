return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "cssls",
        "emmet_language_server",
        "eslint",
        "html",
        "jsonls",
        "tailwindcss",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        ["*"] = {
          capabilities = vim.tbl_deep_extend("force", require("cmp_nvim_lsp").default_capabilities(), {
            workspace = {
              fileOperations = {
                didRename = true,
                willRename = true,
              },
            },
          }),
        },
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        tailwindcss = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  'className\\s*=\\s*"([^"]*)"',
                },
              },
            },
          },
        },
        vtsls = {},
        emmet_language_server = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
  },
}
