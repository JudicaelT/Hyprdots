-- Use clipboard as default registry when yanking.
-- This allows copy-pasting outside the editor
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Clone and use lazy.nvim as package manager
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

-- Load custom configurations in /lua/config directory
local config_files = {
    "format.lua",
    "keymaps.lua",
}
for _, file in ipairs(config_files) do
    vim.cmd("source " .. string.format("%s/lua/config/%s", vim.fn.stdpath("config"), file))
end
