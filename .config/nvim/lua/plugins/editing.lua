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
            local cmp = require("cmp")
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
            local null_ls = require("null-ls")
            null_ls.setup({})
        end
    },

    -----------------------
    -- Autoclose symbols
    -----------------------

    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup()
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
