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
                    "clangd", -- C and C++
                    "csharp_ls",
                    "cssls",
                    "dockerls",
                    "docker_compose_language_service",
                    "dotls",
                    "html",
                    "jsonls",
                    "ts_ls", -- TypeScript / JavaScript
                    "rust_analyzer",
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
            lspconfig.clangd.setup({})
            lspconfig.csharp_ls.setup({})
            lspconfig.cssls.setup({})
            lspconfig.dockerls.setup({})
            lspconfig.docker_compose_language_service.setup({})
            lspconfig.dotls.setup({})
            lspconfig.html.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.ts_ls.setup({
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
            })
            lspconfig.rust_analyzer.setup({})
            lspconfig.phpactor.setup({})
            lspconfig.sqlls.setup({})
            lspconfig.bashls.setup({})
        end
    }

}
