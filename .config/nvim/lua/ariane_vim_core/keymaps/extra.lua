local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save buffer" })
map({ "i", "v", "o" }, "<C-s>", "<esc><cmd>w<CR>", { desc = "Exit current mode and save buffer" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Close buffer" })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("t", "<Esc><Esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
