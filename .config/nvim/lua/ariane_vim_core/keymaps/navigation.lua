local map = vim.keymap.set

map("i", "<C-h>", "<left>", { desc = "Move left in insert mode" })
map("i", "<C-j>", "<down>", { desc = "Move down in insert mode" })
map("i", "<C-k>", "<up>", { desc = "Move up in insert mode" })
map("i", "<C-l>", "<right>", { desc = "Move right in insert mode" })

map({ "n", "v" }, "<C-j>", "5j", { desc = "Go five lines down" })
map({ "n", "v" }, "<C-k>", "5k", { desc = "Go five lines up" })

map({ "n", "v" }, "<C-h>", "{", { desc = "Go to previous paragraph" })
map({ "n", "v" }, "<C-l>", "}", { desc = "Go to next paragraph" })

map({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Center content after 'Ctrl + d'" })
map({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Center content after 'Ctrl + u'" })
map("n", "n", "nzz", { desc = "Center content when jumping to next find" })
map("n", "N", "Nzz", { desc = "Center content when jumping to previous find" })
map({ "n", "v" }, "G", "Gzz", { desc = "Center content when jumping to bottom of buffer" })

map({ "n", "v" }, "<M-h>", "^", { desc = "Go to the beginning of the line" })
map({ "n", "v" }, "<M-l>", "$", { desc = "Go to the end of the line" })

local neoTreeEnabled, _ = pcall(require, "neo-tree")
if neoTreeEnabled then
    map(
        "n",
        "<leader>b",
        "<cmd>Neotree filesystem reveal left<CR>",
        { desc = "Open file tree" }
    )
end

local telescopeIsEnabled, _ = pcall(require, "telescope")
if telescopeIsEnabled then
    local telescope = require("telescope.builtin")
    map(
        "n",
        "<leader>ff",
        "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>",
        { desc = "Search files" }
    )
    map("n", "<leader>fg", telescope.live_grep, { desc = "Grep project" })
end

local harpoonIsEnabled, harpoon = pcall(require, "harpoon")
if harpoonIsEnabled then
    harpoon:setup()
    map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Pin opened buffer" })
    map(
        "n",
        "<leader>hl",
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "List pinned buffers" }
    )
    map("n", "<M-1>", function() harpoon:list():select(1) end, { desc = "Open pinned buffer 1" })
    map("n", "<M-2>", function() harpoon:list():select(2) end, { desc = "Open pinned buffer 2" })
    map("n", "<M-3>", function() harpoon:list():select(3) end, { desc = "Open pinned buffer 3" })
    map("n", "<M-4>", function() harpoon:list():select(4) end, { desc = "Open pinned buffer 4" })
    map("n", "<M-5>", function() harpoon:list():select(5) end, { desc = "Open pinned buffer 5" })
    map("n", "<M-6>", function() harpoon:list():select(6) end, { desc = "Open pinned buffer 6" })
    map("n", "<M-7>", function() harpoon:list():select(7) end, { desc = "Open pinned buffer 7" })
    map("n", "<M-8>", function() harpoon:list():select(8) end, { desc = "Open pinned buffer 8" })
end

local flashIsEnabled, flash = pcall(require, "flash")
if flashIsEnabled then
    map({ "n", "x", "o" }, "<leader>z", function() flash.jump() end, { desc = "Enter Flash mode" })
    map({ "n", "x", "o" }, "<leader>Z", function() flash.treesitter() end, { desc = "Enter Flash Treesitter mode" })
end
