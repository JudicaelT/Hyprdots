return {
    --------------------------------
    -- Colorscheme
    --------------------------------

    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
                transparent = true,
                colors = {
                    -- slightly more vibrant colors than the original theme
                    fg = "#d5d5d5",
                    floatborder = "#999999",
                    line = "#2a2a35",
                    builtin = "#a5e0da",
                    func = "#dd7474",
                    string = "#f0b97a",
                    number = "#f2a45c",
                    property = "#cfcff0",
                    constant = "#bebee6",
                    comment = "#767696",
                    parameter = "#d1a7c9",
                    visual = "#4a5a70",
                    error = "#ef5e76",
                    warning = "#f2a45c",
                    hint = "#90aaf0",
                    operator = "#9aaacc",
                    keyword = "#81a8cc",
                    type = "#9ec8d0",
                    search = "#4a5a70",
                    plus = "#98c87a",
                    delta = "#f5c37d",
                },
            })
            vim.cmd("colorscheme vague")
            -- Override line numbers colors
            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#606079', bold = true })
            vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7894ab', bold = true })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#606079', bold = true })
        end
    },

    --------------------------------
    -- Better UI
    --------------------------------

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
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
        config = function() end,
    },

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
        config = function() end,
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
                sections = {
                    lualine_a = { { 'mode', fmt = function(res) return ' ' .. res end } },
                },
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
        config = function() end
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
                [[                                           ]],
                [[                                           ]],
                [[                                           ]],
                [[                                           ]],
                [[                                         ]],
                [[ █████      ██                         ]],
                [[  █████                                 ]],
                [[   ████████ ███   ███████████       ]],
                [[    ████████ █████ ██████████████       ]],
                [[     ███████ █████ █████ ████ █████       ]],
                [[      ██████ █████ █████ ████ █████      ]],
                [[       ████ █████ █████ ████ ██████ btw ]],
                [[                                           ]],
                [[                                           ]],
                [[                                           ]],
            }

            alpha.setup(dashboard.opts)
        end,
    },
}
