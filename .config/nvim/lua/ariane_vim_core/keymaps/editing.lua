local map = vim.keymap.set

map("v", "<leader>r", "\"_dP", { desc = "Replace selected content by yanked content without overriding registry" })
map("n", "<leader>r", "viw\"_dP", { desc = "Replace word by yanked content without overriding registry" })
map("n", "<leader>R", "viW\"_dP", { desc = "Replace WORD by yanked content without overriding registry" })

map("n", "<leader>c", "ciw", { desc = "Change word" })
map("n", "<leader>C", "ciW", { desc = "Change WORD" })

map("n", "<M-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<M-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })

map("n", "<M-S-k>", "<cmd>t.0<CR>k", { desc = "Duplicate line" })
map("n", "<M-S-j>", "<cmd>t.0<CR>", { desc = "Duplicate line and move cursor to it" })

map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "6", "<C-x>", { desc = "Decrement number" })
