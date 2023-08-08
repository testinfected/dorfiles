--[[
  File: bufferline.lua
  Description: Snazzy bufferline for Neovim
  See: https://github.com/akinsho/bufferline.nvim
]]

local M = {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "catppuccin/nvim",
    },
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" }
    },
    event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
    require("bufferline").setup {
        highlights = require("catppuccin.groups.integrations.bufferline").get() {
            background = {
                italic = true,
            },
            buffer_selected = {
                bold = true,
            },
        },
        options = {
            numbers = "ordinal", -- can be "none" | "ordinal" | "buffer_id" | "both" | function
            diagnostics = "nvim_lsp",
            offsets = {
                {
                    filetype = "lazy",
                    text = "Lazy",
                    highlight = "PanelHeading",
                    padding = 1,
                },
                {
                    filetype = "neo-tree",
                    text = "Project files",
                    highlight = "PanelHeading",
                    --highlight = "Directory",
                    text_align = "center",
                },
            },
            color_icons = true, -- whether or not to add the filetype icon highlights
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            separator_style = "thick",
            groups = {
                options = {
                    toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
                },
                items = {
                    {
                        name = "Tests", -- Mandatory
                        highlight = { sp = require("catppuccin.palettes").get_palette().green }, -- Optional
                        auto_close = true,  -- whether or not close this group if it doesn't contain the current buffer
                        priority = 2, -- determines where it will appear relative to other groups (Optional)
                        icon = "", -- Optional
                        matcher = function(buf) -- Mandatory
                            return buf.name:match('%_test') or
                                    buf.name:match('%_spec') or
                                    buf.name:match('%Test')
                        end,
                    },
                    {
                        name = "Docs",
                        highlight = { sp = require("catppuccin.palettes").get_palette().mauve },
                        auto_close = true,  -- whether or not close this group if it doesn't contain the current buffer
                        matcher = function(buf)
                            return buf.name:match('%.md') or buf.name:match('%.txt')
                        end,
                    }
                }
            }
        }
    }
end

return M