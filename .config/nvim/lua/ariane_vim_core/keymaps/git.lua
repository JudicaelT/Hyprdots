local gitsignsIsEnabled, git = pcall(require, "gitsigns")
if gitsignsIsEnabled then
    local map = vim.keymap.set
    map("n", "<leader>gb", function() git.blame() end, { desc = "Git blame Buffer" })
    map("n", "<leader>gd", function() git.diffthis() end, { desc = "Git diff buffer" })
end
