return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
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
        "basedpyright",
        "ruff",
        "svelte",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "antosha417/nvim-lsp-file-operations",
    },
    config = function()
      local capabilities =
        vim.tbl_deep_extend("force", require("cmp_nvim_lsp").default_capabilities(), {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        })
      vim.lsp.config("*", {
        capabilities = capabilities,
      })
      local servers = {
        lua_ls = {},
        cssls = {
          settings = {
            css = { validate = true },
            scss = { validate = true },
            less = { validate = true },
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
        dartls = {},
        basedpyright = {},
        ruff = {},
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
      }
      for name, opts in pairs(servers) do
        if next(opts) ~= nil then
          vim.lsp.config(name, opts)
        end
        vim.lsp.enable(name)
      end
      require("lsp-file-operations").setup()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp.keymaps", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end
          local buf = args.buf
          local function map(mode, lhs, rhs, desc, method)
            if method and not client:supports_method(method) then
              return
            end
            vim.keymap.set(mode, lhs, rhs, {
              buffer = buf,
              desc = desc,
            })
          end
          map("n", "gd", function()
            Snacks.picker.lsp_definitions()
          end, "Goto Definition", "textDocument/definition")
          map("n", "gr", function()
            Snacks.picker.lsp_references()
          end, "References", "textDocument/references")
          map("n", "gI", function()
            Snacks.picker.lsp_implementations()
          end, "Goto Implementation", "textDocument/implementation")
          map("n", "gy", function()
            Snacks.picker.lsp_type_definitions()
          end, "Goto Type Definition", "textDocument/typeDefinition")
          map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration", "textDocument/declaration")
          map(
            "n",
            "<C-k>",
            vim.lsp.buf.signature_help,
            "Signature Help",
            "textDocument/signatureHelp"
          )
          map("n", "<leader>cr", vim.lsp.buf.rename, "Rename", "textDocument/rename")
          map(
            { "n", "v" },
            "<leader>ca",
            vim.lsp.buf.code_action,
            "Code Action",
            "textDocument/codeAction"
          )
        end,
      })
    end,
  },
}
