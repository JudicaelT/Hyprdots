return {
    {
        "williamboman/mason.nvim",
        config = function()
            local isEnabled, mason = pcall(require, "mason")
            if isEnabled then
                mason.setup()
            end
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local isEnabled, mason = pcall(require, "mason-lspconfig")
            if false == isEnabled then
                return
            end
            mason.setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "clangd",
                    "cssls",
                    "dockerls",
                    "docker_compose_language_service",
                    "dotls",
                    "html",
                    "jsonls",
                    "ts_ls",
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
            local lsp = vim.lsp
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
                gopls = {},
                clangd = {},
                cssls = {},
                dockerls = {},
                docker_compose_language_service = {},
                dotls = {},
                html = {},
                jsonls = {},
                rust_analyzer = {},
                phpactor = {},
                sqlls = {},
                bashls = {},
                ts_ls = {
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                    root_dir = vim.fn.getcwd()
                },
            }
            for serverName, serverConfig in pairs(servers) do
                lsp.config(serverName, serverConfig)
                lsp.enable(serverName)
            end
        end
    },
}
