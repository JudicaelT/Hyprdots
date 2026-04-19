vim.g.mapleader = " " -- Set spacebar as leader key

local core = {
    plugins = { { import = "ariane_vim_core.plugins" } }
}

--- @param plugins table
function core.customizePlugins(plugins)
    table.insert(core.plugins, plugins)
    return core
end

function core.start()
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
    require("lazy").setup(core.plugins)

    require("ariane_vim_core.options.indentation")
    require("ariane_vim_core.options.linenumber")
    require("ariane_vim_core.options.diagnostic")
    require("ariane_vim_core.options.registry")
    require("ariane_vim_core.keymaps.navigation")
    require("ariane_vim_core.keymaps.lsp")
    require("ariane_vim_core.keymaps.git")
    require("ariane_vim_core.keymaps.editing")
    require("ariane_vim_core.keymaps.extra")
end

return core
