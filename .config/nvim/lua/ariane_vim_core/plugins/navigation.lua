return {
    -----------------------
    -- Fuzzy finder
    -----------------------
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local isEnabled, telescope = pcall(require, "telescope")
            if false == isEnabled then
                return
            end
            telescope.setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                find_files = {
                    hidden = true
                },
            }
            telescope.load_extension("ui-select")
        end
    },

    -----------------------
    -- File tree
    -----------------------
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            local isEnabled, neoTree = pcall(require, "neo-tree")
            if false == isEnabled then
                return
            end
            neoTree.setup({
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function()
                            require("neo-tree.command").execute({ action = "close" })
                        end
                    },
                },
            })
        end,
    },

    -----------------------
    -- Buffer pinning
    -----------------------
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -----------------------
    -- Character jump
    -----------------------
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
    },
}
