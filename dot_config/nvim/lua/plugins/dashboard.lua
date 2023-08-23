local M = {
  'goolord/alpha-nvim',
  event = 'VimEnter',
}

local function configure(dashboard)
  -- Set header
    -- e.g. https://patorjk.com/software/taag/#p=display&v=0&f=Bloody&t=NeoVim
  dashboard.section.header.val = {
    "███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ",
    "██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ",
    "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
    "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
    "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
    "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
    "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
    "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
    "         ░    ░  ░    ░ ░        ░   ░         ░   ",
    "                                ░                  "
  }
  dashboard.section.header.opts.hl = 'AlphaHeader'

  dashboard.section.buttons.val = {
    dashboard.button('g', "    Last session", [[<Cmd>SessionLoadLast<CR>]]),
    dashboard.button('o', "    Open session", [[<Cmd>Telescope persisted<CR>]]),
    dashboard.button('p', "󱚉    Recent projects", [[<Cmd>Telescope projects<CR>]]),
    dashboard.button('r', "󱋢    Recent files", [[<Cmd>Telescope oldfiles<CR>]]),
    dashboard.button('n', "    New file", [[<Cmd>ene <BAR> startinsert<CR>]]),
    dashboard.button('f', "󰮗    Find file", [[<Cmd>Telescope file_browser<CR>]]),
    dashboard.button('l', "󰒲    Lazy", [[<Cmd>Lazy<CR>]]),
    dashboard.button('m', "    Mason", [[<Cmd>Mason<CR>]]),
    dashboard.button('b', "󰄉    Profile", [[<Cmd>Lazy profile<CR>]]),
    dashboard.button('q', "󰿅    Quit", [[<Cmd>qa<CR>]]),
  }
  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = 'AlphaCenter'
    button.opts.hl_shortcut = 'AlphaShortcut'
  end
  dashboard.section.footer.opts.hl = 'AlphaFooter'
  dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
  dashboard.config.layout[3].val = 5

  return dashboard
end

function M.config()
  -- close lazy and re-open when the dashboard is ready
  if vim.o.filetype == 'lazy' then
    vim.cmd.close()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaReady',
      callback = function()
        require('lazy').show()
      end,
    })
  end

  local dashboard = configure(require('alpha.themes.dashboard'))
  require('alpha').setup(dashboard.config)

  vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyVimStarted',
    callback = function()
      local stats = require('lazy').stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "󱐋 " .. stats.count .. " plugins loaded in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M