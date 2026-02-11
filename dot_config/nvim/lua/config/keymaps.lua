local map = vim.keymap.set
local del = vim.keymap.del

local opts = { noremap = true, silent = true }

-- Toggle spell check
map("n", "<C-s>", ":set spell!<CR>", { desc = "Toggle spell check", silent = true })
map("i", "<C-s>", "<C-O>:set spell!<CR>", { desc = "Toggle spell check", silent = true })

-- Spell mutations
map("n", "zg", "zg", { desc = "Mark word as correct" })
map("n", "zw", "zw", { desc = "Mark word as incorrect" })

-- Resize window
del("n", "<C-Up>")
del("n", "<C-Down>")
del("n", "<C-Left>")
del("n", "<C-Right>")

-- better command
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<A-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<A-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Move Lines
del("i", "<A-j>")
del("i", "<A-k>")

map("v", "<C-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down", silent = true })
map("v", "<C-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up", silent = true })

-- better indenting
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- splits
del("n", "<leader>|")

map("n", "-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "=", "<C-W>v", { desc = "Split Window Right", remap = true })

-- better scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down", remap = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up", remap = true })

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrapping", remap = true, silent = true })

-- Duplicate line and comment the first line
map("n", "ycc", '"yy" . v:count1 . "gcc\']p"', { remap = true, expr = true })

-- Toggle cursor line
vim.keymap.set("n", "<leader>ux", function()
  vim.wo.cursorline = not vim.wo.cursorline
end, { desc = "Toggle cursor line" })
