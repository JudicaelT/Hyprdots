return {
    --------------------------------
    -- Color Scheme
    --------------------------------
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "moon",
                light_style = "day",
                transparent = true,
                terminal_colors = true,
                colors = {},
                highlight = {},
            })
            vim.cmd("colorscheme tokyonight")
            -- Override line numbers colors
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#86979f', bold = true })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = '#65a2c1', bold = true })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#86979f', bold = true })
            -- Override comments color
            vim.api.nvim_set_hl(0, "Comment", { fg = "#86979f" })
        end,
    },

    --------------------------------
    -- Code highlighting
    --------------------------------

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "nvim-treesitter.configs".setup {
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            }
        end
    },

    -------------------------
    -- Word Highlighting
    -------------------------

    {
        "RRethy/vim-illuminate",
        opts = {
            delay = 100,
        },
        config = function()
        end,
    },

    --------------------------------
    -- Better Ui and Notifications
    --------------------------------

    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- },

    --------------------------------
    -- File Tree
    --------------------------------

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
        end
    },

    --------------------------------
    -- Status Bar
    --------------------------------

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lualine').setup {
                options = {
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
            }
        end
    },

    --------------------------------
    -- Which Key
    --------------------------------

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
        end
    },


    --------------------------------
    -- Start page
    --------------------------------

    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                       ]],
                [[                                                                       ]],
                [[                                                                       ]],
            }

            alpha.setup(dashboard.opts)
        end,
    },
}
