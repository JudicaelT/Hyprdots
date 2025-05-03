-- Use spaces instead of tabs (set to 4 spaces by default)
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Show relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Display diagnostic at the end of the line
vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        format = function(diagnostic)
            local icons = {
                [vim.diagnostic.severity.ERROR] = "  ",
                [vim.diagnostic.severity.WARN]  = "  ",
                [vim.diagnostic.severity.INFO]  = "  ",
                [vim.diagnostic.severity.HINT]  = "  ",
            }
            return icons[diagnostic.severity] .. diagnostic.message
        end,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})
