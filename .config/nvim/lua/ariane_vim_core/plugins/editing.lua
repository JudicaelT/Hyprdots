return {
    -----------------------
    -- Auto-completion
    -----------------------
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local isEnabled, cmp = pcall(require, "cmp")
            if false == isEnabled then
                return
            end
            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources(
                    { { name = "nvim_lsp" } },
                    { { name = "buffer" } }
                ),
            })
        end,
    },
    {
        "hanspinckaers/zap.nvim",
        lazy = false,
        init = function()
            vim.opt.completeopt = "menu,menuone,noselect"
        end,
        config = function() end,
        enabled = true
    },

    -----------------------
    -- Multiline editing
    -----------------------
    {
        "mg979/vim-visual-multi",
        config = function() end,
    },

    -----------------------
    -- Formatting
    -----------------------
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local isEnabled, nullLs = pcall(require, "null-ls")
            if isEnabled then
                nullLs.setup({})
            end
        end
    },

    -----------------------
    -- Autoclose symbols
    -----------------------
    {
        "m4xshen/autoclose.nvim",
        config = function()
            local isEnabled, autoclose = pcall(require, "autoclose")
            if isEnabled then
                autoclose.setup()
            end
        end,
    },

    -----------------------
    -- Comments
    -----------------------
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
}
