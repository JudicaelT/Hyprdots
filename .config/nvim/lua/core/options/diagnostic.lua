-- Display diagnostics at the end of the line
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
