-- prevent commenting the next line to a comment
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "pug",
  callback = function()
    vim.api.nvim_set_hl(0, "@string.special.path.pug", { underline = false })
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd("highlight htmlLink gui=NONE cterm=NONE")
  end,
})

vim.hl.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    format = function(diagnostic)
      local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
      return string.format("%s %s", code, diagnostic.message)
    end,
  },
  underline = false,
  update_in_insert = true,
  float = {
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  },
  on_ready = function()
    vim.cmd("highlight DiagnosticVirtualText guibg=NONE")
  end,
})

-- local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function()
--     vim.hl.on_yank()
--   end,
--   group = highlight_group,
--   pattern = "*",
-- })

-- disable relative line numbers in insert (current window only)
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
})

local arg = vim.fn.argv(0)
if type(arg) == "table" then
  arg = arg[1]
end
if vim.fn.argc() == 1 and vim.fn.isdirectory(arg) == 1 then
  vim.cmd("cd " .. vim.fn.fnameescape(arg))
end
