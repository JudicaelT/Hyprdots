local map = vim.keymap.set

map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Read symbols's documentation" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Open code actions" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>", { desc = "Display full lsp diagnostic" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Auto-indent file" })
