local function augroup(name)
  return vim.api.nvim_create_augroup("nevo_" .. name, { clear = true })
end

local arg = vim.fn.argv(0)
if type(arg) == "table" then
  arg = arg[1]
end

if vim.fn.argc() == 1 and vim.fn.isdirectory(arg) == 1 then
  vim.cmd("cd " .. vim.fn.fnameescape(arg))
end

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf

    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
      return
    end

    vim.b[buf].last_loc = true

    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)

    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dap-float",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false

    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("formatoptions"),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup("relative_number_insert"),
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = augroup("relative_number_insert"),
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup("html_link"),
  callback = function()
    vim.cmd("highlight htmlLink gui=NONE cterm=NONE")
  end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
  group = augroup("clear_highlights"),
  pattern = { "[vV\x16]*:n", "[oO]*:n" },
  callback = function()
    vim.cmd("nohlsearch")
  end,
})

local function snacks_git_highlights()
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusAdded", {
    fg = "#8fb573",
    bold = true,
  })

  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusModified", {
    fg = "#7daea3",
    bold = true,
  })

  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", {
    fg = "#d8a657",
    bold = true,
  })

  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusDeleted", {
    fg = "#e67e80",
    bold = true,
  })

  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored", {
    fg = "#7c8377",
    italic = true,
  })
end

snacks_git_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup("snacks_git_highlights"),
  callback = snacks_git_highlights,
})
