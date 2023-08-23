--[[
  File: dap.lua
  Description: Debug Adapter Protocol client
  See: https://github.com/mfussenegger/nvim-dap
]]

local M = {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
}

local function ask(prompt)
  vim.fn.inputsave()
  local input = vim.fn.input(prompt .. ": ")
  vim.fn.inputrestore()
  return input
end

function M.config()
  local keys = require('core.utils').keys
  local dap = require('dap')
  local sign = vim.fn.sign_define

  --dap.defaults.fallback.terminal_win_cmd = 'ToggleTerm'

  -- Custom signs
  sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
  sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
  sign('DapBreakpointReject', { text = '●', texthl = 'DiagnosticSignHint', linehl = '', numhl = '' })
  sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
  sign('DapStopped', { text = '→ ', texthl = 'DiagnosticSignWarn', linehl = 'Visual', numhl = 'DiagnosticSignWarn' })

  -- Key mappings
  local prefix = '<leader>d'
  keys.nmap(prefix .. 'c', dap.continue, { desc = "Continue/Start" })
  keys.nmap(prefix .. 'd', dap.disconnect, { desc = "Disconnect" })
  keys.nmap(prefix .. 'bb', dap.toggle_breakpoint, { desc = "Toggle" })
  keys.nmap(prefix .. 'bc', function() dap.toggle_breakpoint(ask("Condition")) end, { desc = "Toggle conditionally" })
  keys.nmap(prefix .. 'bh', function() dap.toggle_breakpoint(nil, ask("Hit number")) end, { desc = "Hit number" })
  keys.nmap(prefix .. 'bl', function() dap.toggle_breakpoint(nil, nil, ask("Message")) end, { desc = "Log" })
end

return M