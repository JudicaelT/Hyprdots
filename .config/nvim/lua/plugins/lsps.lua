return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "omnisharp", -- C#
                    "cssls",
                    "dockerls",
                    "docker_compose_language_service",
                    "dotls",
                    "html",
                    "jsonls",
                    "quick_lint_js", -- JavaScript
                    "marksman", -- MarkDown
                    "phpactor",
                    "sqlls",
                    "bashls",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.omnisharp.setup({})
            lspconfig.cssls.setup({})
            lspconfig.dockerls.setup({})
            lspconfig.docker_compose_language_service.setup({})
            lspconfig.dotls.setup({})
            lspconfig.html.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.quick_lint_js.setup({})
            lspconfig.marksman.setup({})
            lspconfig.phpactor.setup({})
            lspconfig.sqlls.setup({})
            lspconfig.bashls.setup({})
        end
    }
}
