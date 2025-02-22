local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local telescope = require("telescope.builtin")
local harpoon = require("harpoon")
harpoon:setup()

-- Remap "go to line begin" and "go to line end"
keymap.set("n", "m", "$", { noremap = true, silent = true })

-- Switched numbers and symbols to avoid pressing shift
keymap.set("n", "&", "1")
keymap.set("n", "é", "2")
keymap.set("n", "\"", "3")
keymap.set("n", "'", "4")
keymap.set("n", "(", "5")
keymap.set("n", "-", "6")
keymap.set("n", "è", "7")
keymap.set("n", "_", "8")
keymap.set("n", "ç", "9")
keymap.set("n", "à", "0")
keymap.set("n", "1", "&")
keymap.set("n", "2", "é")
keymap.set("n", "3", "\"")
keymap.set("n", "4", "'")
keymap.set("n", "5", "(")
keymap.set("n", "7", "è")
keymap.set("n", "7", "_")
keymap.set("n", "9", "ç")
keymap.set("n", "0", "à")

-- "shift + d" to go to definition
keymap.set("n", "D", vim.lsp.buf.definition, {})
-- "?" to read hovered element's doc comment
keymap.set("n", "?", vim.lsp.buf.hover, {})
-- ";" to open code actions
keymap.set("n", ";", vim.lsp.buf.code_action, {})
-- "f2" to rename symbol
keymap.set("n", "<f2>", vim.lsp.buf.rename, {})
-- "leader + e" to show lsp error
keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(0, {scope = \"line\"})<CR>")

-- "leader + b" to open file tree
keymap.set("n", "<leader>b", "<cmd>Neotree filesystem reveal left<CR>")

-- `leader + f` to grep current project (/!\ requires ripgrep /!\)
-- `leader + p` to search for files
-- `Ctrl + f` to grep in current buffer
keymap.set("n", "<leader>f", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>")
keymap.set("n", "<leader>g", telescope.live_grep)
keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<CR>")
keymap.set("n", "!", '<cmd>lua require("telescope.builtin").lsp_references()<CR>')

-- "+" to increment and "-" to decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "6", "<C-x>")

-- "Ctrl + a" to select all text
keymap.set("n", "<C-a>", "gg<S-v>G")

-- "Leader + s" to save file
keymap.set("n", "<leader>s", "<cmd>w<Return>")

-- "Leader + q" to close buffer
keymap.set("n", "<leader>q", "<cmd>q<Return>")

-- "Crtl + k" to go five lines up
-- "Ctrl + j" to go five lines down
keymap.set("n", "<C-k>", "5k")
keymap.set("n", "<C-j>", "5j")

-- "alt + up" to move line up and "alt + down" to move line down
keymap.set("n", "<M-k>", "<cmd>m .-2<CR>==")
keymap.set("n", "<M-Up>", "<cmd>m .-2<CR>==")
keymap.set("n", "<M-j>", "<cmd>m .+1<CR>==")
keymap.set("n", "<M-Down>", "<cmd>m .+1<CR>==")

-- "alt + shift + up" to duplicate line and "alt + shift + down" to duplicate line and go to the duplicated line
keymap.set("n", "<M-S-k>", "<cmd>t.0<Return>k=j")
keymap.set("n", "<M-S-Up>", "<cmd>t.0<Return>k=j")
keymap.set("n", "<M-S-j>", "<cmd>t.0<Return>")
keymap.set("n", "<M-S-Down>", "<cmd>t.0<Return>")

-- "shift + tab" to decrement by one tab and "tab" to add a tab
keymap.set("n", "<S-tab>", "<<", opts)
keymap.set("n", "<tab>", ">>", opts)

-- "Leader + n" to split buffer
keymap.set("n", "<leader>n", "<cmd>vsplit<Return>", opts)

-- "Leader + a" to add buffer to harpoon
keymap.set("n", "<leader>a", function() harpoon:list():add() end)

-- "Leader + l" to list harpoon buffers
keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- "ctrl + a" in insert mode accept copilot suggestion
keymap.set("i", "<C-a>", 'copilot#Accept("<CR>")', {noremap = true, silent = true, expr = true, replace_keycodes = false })
-- "leader + c" to open copilot chat
keymap.set("n", "<leader>c", "<cmd>Copilot panel<Return>")

-- "leader + shift + b" to toggle git-blame
keymap.set('n', '<leader>B', ':GitBlameToggle<CR>', { noremap = true, silent = true })

-- "alt + 1 | 2 | 3 | 4 | ...." to switch to harpoon buffer
keymap.set("n", "<M-&>", function() harpoon:list():select(1) end)
keymap.set("n", "<M-é>", function() harpoon:list():select(2) end)
keymap.set("n", "<M-\">", function() harpoon:list():select(3) end)
keymap.set("n", "<M-'>", function() harpoon:list():select(4) end)
keymap.set("n", "<M-(>", function() harpoon:list():select(5) end)
keymap.set("n", "<M-->", function() harpoon:list():select(6) end)
keymap.set("n", "<M-è>", function() harpoon:list():select(7) end)
keymap.set("n", "<M-_>", function() harpoon:list():select(8) end)
keymap.set("n", "<M-ç>", function() harpoon:list():select(9) end)
keymap.set("n", "<M-à>", function() harpoon:list():select(10) end)
