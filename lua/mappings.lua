require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end)

map("n", "<leader>dpr", function() require("dap-python").test_method() end)
