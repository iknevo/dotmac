vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.deprecation_warnings = false
vim.g.markdown_recommended_style = 0
vim.g.have_nerd_font = true

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.linespace = 4

vim.opt.fillchars = {
  diff = "╱",
  eob = " ",
}

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  },
  virtual_text = {
    prefix = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = "󰌵 ",
      }
      return icons[diagnostic.severity]
    end,
    format = function(diagnostic)
      return (diagnostic.message:gsub("^%[.-%]%s*", ""))
    end,
  },
  virtual_lines = false,
  underline = false,
  update_in_insert = true,
  float = {
    source = true,
  },
  on_ready = function()
    vim.cmd("highlight DiagnosticVirtualText guibg=NONE")
  end,
})

-- vim.opt.pumblend = 10
-- vim.opt.pumheight = 10

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.winminwidth = 5
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4
vim.opt.jumpoptions = "view"

vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.virtualedit = "block"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.iskeyword:remove("_")

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.smoothscroll = true
vim.opt.spelllang = { "en" }

vim.opt.shortmess:append("I")

vim.api.nvim_set_hl(0, "htmlLink", { underline = false })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true })
vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true })
vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true })
