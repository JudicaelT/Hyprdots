local map = vim.keymap.set
local lsp = vim.lsp.buf

map("n", "<leader>ld", lsp.definition, { desc = "Go to definition" })
map("n", "<leader>li", lsp.implementation, { desc = "Go to implementation" })
map("n", "<leader>lh", lsp.hover, { desc = "Read symbols's documentation" })
map("n", "<leader>la", lsp.code_action, { desc = "Open code actions" })
map("n", "<leader>lr", lsp.rename, { desc = "Rename symbol" })
map(
    "n",
    "<leader>le",
    "<cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>",
    { desc = "Display full diagnostic" }
)
map("n", "<leader>lf", lsp.format, { desc = "Auto-indent file" })

local telescopeIsEnabled, _ = pcall(require, "telescope")
if telescopeIsEnabled then
    map(
        "n",
        "<leader>lR",
        function() require("telescope.builtin").lsp_references() end,
        { desc = "Find element references" }
    )
end
