-- Use spaces instead of tabs (set to 4 spaces by default)
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Show line number
vim.wo.number = true
vim.wo.relativenumber = true

-- Use clipboard as default registry when yanking. This allows us to paste outside the editor
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Set spacebar as leader key
vim.g.mapleader = " "

-- Clone and use LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Load custom configurations in the /lua/config directory
local config_files = {
    "keymaps.lua",
}
for _, name in ipairs(config_files) do
    vim.cmd("source " .. string.format("%s/lua/config/%s", vim.fn.stdpath("config"), name))
end
