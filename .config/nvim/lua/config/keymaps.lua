---------------------------------------------------------------------
--  ___                     _            _   _
-- |_ _|_ __  _ __  ___ _ _| |_ __ _ _ _| |_| |
--  | || '  \| '_ \/ _ \ '_|  _/ _` | ' \  _|_|
-- |___|_|_|_| .__/\___/_|  \__\__,_|_||_\__(_)
--           |_|
--
-- These keymaps have been made with an Azerty (french)
-- keyboard layout in mind. Therefore, some remaps may not be
-- appropriate for other layouts
---------------------------------------------------------------------



local map = vim.keymap.set
-- Set spacebar as leader key
vim.g.mapleader = " "

-------------------
--  _
-- | |____ __
-- | (_-< '_ \
-- |_/__/ .__/
--      |_|
-------------------

map("n", "D", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "?", vim.lsp.buf.hover, { desc = "Read symbols's documentation" })
map("n", ";", vim.lsp.buf.code_action, { desc = "Open code actions" })
map("n", "<f2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>", { desc = "Display full lsp diagnostic" })
map("n", "<leader>b", "<cmd>Neotree filesystem reveal left<CR>", { desc = "Open file tree" })


--------------------------------------------------------------------------
--  ___          _        _     _  _          _           _   _
-- | _ \_ _ ___ (_)___ __| |_  | \| |__ ___ _(_)__ _ __ _| |_(_)___ _ _
-- |  _/ '_/ _ \| / -_) _|  _| | .` / _` \ V / / _` / _` |  _| / _ \ ' \
-- |_| |_| \___// \___\__|\__| |_|\_\__,_|\_/|_\__, \__,_|\__|_\___/_||_|
--            |__/                             |___/
--------------------------------------------------------------------------

local telescope = require("telescope.builtin")
local harpoon = require("harpoon")
harpoon:setup()

map("n", "<leader>f", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>",
    { desc = "Search file in project" })
map("n", "<leader>g", telescope.live_grep, { desc = "Grep in project" })
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>",
    { desc = "Grep in current buffer" })
map("n", "!", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', { desc = "Find element references" })

map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Pin opened buffer" })
map("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "List pinned buffers" })

map("n", "<M-&>", function() harpoon:list():select(1) end, { desc = "Open pinned buffer 1" })
map("n", "<M-é>", function() harpoon:list():select(2) end, { desc = "Open pinned buffer 2" })
map("n", "<M-\">", function() harpoon:list():select(3) end, { desc = "Open pinned buffer 3" })
map("n", "<M-'>", function() harpoon:list():select(4) end, { desc = "Open pinned buffer 4" })
map("n", "<M-(>", function() harpoon:list():select(5) end, { desc = "Open pinned buffer 5" })
map("n", "<M-->", function() harpoon:list():select(6) end, { desc = "Open pinned buffer 6" })
map("n", "<M-è>", function() harpoon:list():select(7) end, { desc = "Open pinned buffer 7" })
map("n", "<M-_>", function() harpoon:list():select(8) end, { desc = "Open pinned buffer 8" })


-------------------------------------------------------------------------
--  ___       __  __           _  _          _           _   _          
-- | _ )_  _ / _|/ _|___ _ _  | \| |__ ___ _(_)__ _ __ _| |_(_)___ _ _  
-- | _ | || |  _|  _/ -_| '_| | .` / _` \ V | / _` / _` |  _| / _ | ' \ 
-- |___/\_,_|_| |_| \___|_|   |_|\_\__,_|\_/|_\__, \__,_|\__|_\___|_||_|
--                                            |___/                     
-------------------------------------------------------------------------

map({ 'n', 'v' }, "<C-j>", "5j", { desc = "Go five lines down" })
map({ 'n', 'v' }, "<C-k>", "5k", { desc = "Go five lines up" })

map({ 'n', 'v' }, '<C-h>', '{', { desc = "Go to previous paragraph" })
map({ 'n', 'v' }, '<C-l>', '}', { desc = "Go to next paragraph" })

map({ 'n', 'v' }, "<C-d>", "<C-d>zz", { desc = "Center content after 'Ctrl + d'" })
map({ 'n', 'v' }, "<C-u>", "<C-u>zz", { desc = "Center content after 'Ctrl + u'" })
map("n", "n", "nzz", { desc = "Center content after going to next find" })
map("n", "N", "Nzz", { desc = "Center content after going to previous find" })
map({ 'n', 'v' }, "G", "Gzz", { desc = "Center content after going to bottom of the buffer" })

map({ 'n', 'v' }, "<M-h>", "^", { desc = "Go the beginning of the line" })
map({ 'n', 'v' }, "<M-l>", "$", { desc = "Go the end of the line" })

map("n", "<leader>s", "<cmd>SymbolsOutline<CR>", { desc = "Open symbols tree" })

local flash = require("flash");
map({ "n", "x", "o" }, "<leader>z", function() flash.jump() end, { desc = "Enter Flash mode" })
map({ "n", "x", "o" }, "<leader>Z", function() flash.treesitter() end, { desc = "Enter Flash Treesitter mode" })

----------------------------------------------
--   ___ _ _   
--  / __(_| |_ 
-- | (_ | |  _|
--  \___|_|\__|
--             
----------------------------------------------

local git = require('gitsigns')

map("n", "<leader>gb", function() git.blame() end, { desc = "Blame Buffer" } )
map("n", "<leader>gd", function() git.diffthis() end, { desc = "Git diff buffer" } )


----------------------------------------------
--   ___  _   _
--  / _ \| |_| |_  ___ _ _
-- | (_) |  _| ' \/ -_) '_|
--  \___/ \__|_||_\___|_|
--
----------------------------------------------

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
