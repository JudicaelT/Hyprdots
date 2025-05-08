local map = vim.keymap.set

-- Switch numbers and symbols to avoid having to press shift in normal or visual mode
map({ 'n', 'v' }, "&", "1")
map({ 'n', 'v' }, "é", "2")
map({ 'n', 'v' }, "\"", "3")
map({ 'n', 'v' }, "'", "4")
map({ 'n', 'v' }, "(", "5")
map({ 'n', 'v' }, "-", "6")
map({ 'n', 'v' }, "è", "7")
map({ 'n', 'v' }, "_", "8")
map({ 'n', 'v' }, "ç", "9")
map({ 'n', 'v' }, "à", "0")
map({ 'n', 'v' }, "1", "&")
map({ 'n', 'v' }, "2", "é")
map({ 'n', 'v' }, "3", "\"")
map({ 'n', 'v' }, "4", "'")
map({ 'n', 'v' }, "5", "(")
map({ 'n', 'v' }, "7", "è")
map({ 'n', 'v' }, "7", "_")
map({ 'n', 'v' }, "9", "ç")
map({ 'n', 'v' }, "0", "à")

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save buffer" })
map({ "i", "v", "o" }, "<C-s>", "<esc><cmd>w<CR>", { desc = "Exit current mode and save buffer" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Close buffer" })

map("n", "<leader>n", "<cmd>vsplit<Return>", { noremap = true, silent = true }, { desc = "Split buffer vertically" })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("t", "<Esc><Esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
