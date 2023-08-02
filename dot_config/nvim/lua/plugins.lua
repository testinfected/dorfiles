--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
]]

-- Bootstrap lazy.nvim
local lazy = require("helpers.lazy").bootstrap()

-- Load plugins
lazy.setup {
    ui = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    spec = {
        -- Hotpot fennel compiler {{{
        {
            "rktjmp/hotpot.nvim"
        },
        -- }}}

        -- Mason + LSP {{{
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            dependencies = {
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig",
            },
            config = function()
                require "config.mason"
                require "config.lsp"
            end
        },
        -- }}}

        -- Neo Tree {{{
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
            },
            config = function()
                require "config.neotree"
            end
        },
        -- }}}

        -- Telescope {{{
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.2',
            dependencies = {
                "nvim-lua/plenary.nvim",
                "ahmedkhalf/project.nvim",
                "nvim-telescope/telescope-file-browser.nvim",
                {
                    -- much faster fzf than its lua counterpart
                    'nvim-telescope/telescope-fzf-native.nvim',
                    build = 'make',
                },
            },
            config = function()
                require "config.telescope"
            end
        },
        -- }}}

        -- CMP {{{
        {
            'hrsh7th/nvim-cmp',
            lazy = true,
            event = "InsertEnter",
            dependencies = {
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-emoji',
                'hrsh7th/cmp-nvim-lsp-signature-help',
                'hrsh7th/cmp-nvim-lua',
                'rafamadriz/friendly-snippets',
            },
            config = function()
                require "config.cmp"
            end
        },
        -- }}}

        -- LSP Kind {{{
        {
            'onsails/lspkind-nvim',
            lazy = true,
            config = function()
                require "config.lspkind"
            end
        },
        -- }}}

        -- Git Signs {{{
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require "config.gitsigns"
            end
        },
        -- }}}

        -- Toggle Term {{{
        {
            'akinsho/toggleterm.nvim',
            config = function()
                require "config.toggleterm"
            end
        },
        --}}}

        -- Trouble {{{
        {
            "folke/trouble.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = function()
                require "config.trouble"
            end,
        },
        -- }}}

        -- TreeSitter {{{
        {
            "nvim-treesitter/nvim-treesitter",
            lazy = true,
            dependencies = {
                "nvim-treesitter/nvim-treesitter-textobjects"
            },
            build = ":TSUpdate",
            event = { "BufReadPost", "BufNewFile" },
            config = function()
                require "config.treesitter"
            end
        },

        -- adds various text objects to give more targets to operate on
        -- :help targets-settings
        {
            "wellle/targets.vim"
        },

        -- Adds a new operator to toggle comments in code
        -- :help comment-nvim
        {
            "numToStr/Comment.nvim"
        },
        -- }}}

        -- Text editing extras {{{
        ---all about "surroundings": parentheses, brackets, quotes, XML tags, and more
        {
            "tpope/vim-surround"
        },

        -- complementary pairs of mappings
        {
            "tpope/vim-unimpaired"
        },

        -- Extand usage of repeat (.) to surround, unimpaired and treesitter
        {
            "tpope/vim-repeat"
        },
        -- }}},

        -- Which Key {{{
        {
            "folke/which-key.nvim",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
            config = function()
                require "config.which-key"
            end
        },
        -- }}}

        -- Catpuccin theme {{{
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                require("catppuccin").setup {
                    flavor = "mocha",
                    term_colors = true,
                    --transparent_background = true,
                    --native_lsp = {
                    --    enabled = true,
                    --    underlines = {
                    --        errors = { "undercurl" },
                    --        hints = { "undercurl" },
                    --        warnings = { "undercurl" },
                    --        information = { "undercurl" },
                    --    },
                    --},
                    vim.cmd [[colorscheme catppuccin]]
                }
            end
        }
        -- }}}
    }
}

-- Might as well set up an easy-access keybinding
local keys = require("helpers.keys")
keys.register {
    ["<leader>p"] = {
        name = "+plugins",
        s = { "<cmd>Lazy<CR>", "Show" }
    }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0