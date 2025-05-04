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

map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "6", "<C-x>", { desc = "Decrement number" })

map("v", "<leader>r", "\"_dP", { desc = "Replace selected content by yanked content without overriding registry" })
map("n", "<leader>r", "viw\"_dP", { desc = "Replace word by yanked content without overriding registry" })
map("n", "<leader>R", "viW\"_dP", { desc = "Replace WORD by yanked content without overriding registry" })

map("n", "<C-s>", "<cmd>w<Return>", { desc = "Save buffer" })
map("n", "<C-q>", "<cmd>q<Return>", { desc = "Close buffer" })

map("n", "<M-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<M-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })

map("n", "<M-S-k>", "<cmd>t.0<Return>k=j", { desc = "Duplicate line" })
map("n", "<M-S-j>", "<cmd>t.0<Return>", { desc = "Duplicate line and move cursor to it" })

map("n", "<tab>", ">>", { noremap = true, silent = true }, { desc = "Increment by one tab" })
map("n", "<S-tab>", "<<", { noremap = true, silent = true }, { desc = "Decrement by one tab" })

map("n", "<leader>n", "<cmd>vsplit<Return>", { noremap = true, silent = true }, { desc = "Split buffer vertically" })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

map("n", "<S-A-f>", vim.lsp.buf.format, { desc = "Auto-indent file" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("t", "<Esc><Esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })
