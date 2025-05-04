local map = vim.keymap.set

map("n", "D", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "?", vim.lsp.buf.hover, { desc = "Read symbols's documentation" })
map("n", ";", vim.lsp.buf.code_action, { desc = "Open code actions" })
map("n", "<f2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>", { desc = "Display full lsp diagnostic" })
map("n", "<leader>b", "<cmd>Neotree filesystem reveal left<CR>", { desc = "Open file tree" })
