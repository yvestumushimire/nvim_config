require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map("n", "<leader>db", function() require("dap").toggle_breakpoint() end)

map("n", "<leader>dpr", function() require("dap-python").test_method() end)

map("n", "<A-j>", "<cmd>m .+1<CR>==", {desc="Move line down"})
map("n", "<A-k>", "<cmd>m .-2<CR>==", {desc="Move line up"})
map("i", "<A-j>", "<ESC><cmd>m .+1<CR>==gi", {desc="Move line down"})
map("i", "<A-k>", "<ESC><cmd>m .-2<CR>==gi", {desc="Move line up"})
map("v", "J", ":m '>+1<CR>gv=gv", {desc="Move line down"})
map("v", "K", ":m '<-2<CR>gv=gv", {desc="Move line up"})
