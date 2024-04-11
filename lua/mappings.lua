require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end)

map("n", "<leader>dpr", function() require("dap-python").test_method() end)

map("n", "<A-j>", "<cmd>m .+1<CR>==", {desc="Move line down"})
map("n", "<A-k>", "<cmd>m .-2<CR>==", {desc="Move line up"})
map("i", "<A-j>", "<ESC><cmd>m .+1<CR>==gi", {desc="Move line down"})
map("i", "<A-k>", "<ESC><cmd>m .-2<CR>==gi", {desc="Move line up"})
map("v", "J", ":m '>+1<CR>gv=gv", {desc="Move line down"})
map("v", "K", ":m '<-2<CR>gv=gv", {desc="Move line up"})
