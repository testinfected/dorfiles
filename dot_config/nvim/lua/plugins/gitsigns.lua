--[[
  File: gitsigns.lua
  Description: Super fast git decorations
  See: https://github.com/lewis6991/gitsigns.nvim
]]

local M = {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" }
}

local function register_keybindings(buffer)
    local next_hunk = function()
        if vim.wo.diff then
            return ']c'
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return '<Ignore>'
    end

    local prev_hunk = function()
        if vim.wo.diff then
            return '[c'
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return '<Ignore>'
    end

    local keys = require "core.utils".keys
    local git = package.loaded.gitsigns
    local telescope = require "telescope.builtin"

    -- Navigation
    keys.nmap(']h', next_hunk, { desc = "Next hunk", expr = true, buffer = buffer })
    keys.nmap('[h', prev_hunk, { desc = "Previous hunk", expr = true, buffer = buffer })

    local prefix = '<leader>g'
    -- +git actions
    keys.nmap(prefix .. 's', git.stage_hunk, { desc = "Stage hunk" })
    keys.nmap(prefix .. 'r', git.reset_hunk, { desc = "Reset hunk" })
    keys.nmap(prefix .. 'u', git.undo_stage_hunk, { desc ="Undo stage hunk" })
    keys.nmap(prefix .. 'S', git.stage_buffer, { desc = "Stage buffer" })
    keys.nmap(prefix .. 'R', git.reset_buffer, { desc = "Reset buffer" })
    keys.nmap(prefix .. 'p', git.preview_hunk, { desc = "Preview hunk" })
    keys.nmap(prefix .. 'd', git.diffthis, { desc = "View diff" })
    keys.nmap(prefix .. 'd', function() git.diffthis('~') end, { desc = "View diff to head" })
    keys.nmap(prefix .. 'b', git.blame_line, { desc = "Blame" })
    keys.nmap(prefix .. 'B', function() git.blame_line { full = true } end, { desc = "Full blame" })
    keys.nmap(prefix .. 'h', telescope.git_bcommits, { desc = "File history" })
    -- +show
    keys.nmap(prefix .. 'gc', telescope.git_commits, { desc = "Commits" })
    keys.nmap(prefix .. 'gb', telescope.git_branches, { desc = "Branches" })
    keys.nmap(prefix .. 'gm', telescope.git_status, { desc = "Changes" })
    keys.nmap(prefix .. 'gs', telescope.git_stash, { desc = "Stash" })
    -- +toggle
    keys.nmap(prefix .. 'tb', git.toggle_current_line_blame, { desc = "Current line blame" })
    keys.nmap(prefix .. 'td', git.toggle_deleted, { desc = "Deleted" })
    -- Text objects
    keys.map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk" })
end

function M.config()
    local gitsigns = require "gitsigns"

    gitsigns.setup {
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'right_align',
            delay = 1000,
            ignore_whitespace = false,
        },
        preview_config = {
            -- Options passed to nvim_open_win
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
        on_attach = register_keybindings
    }
end

return M
