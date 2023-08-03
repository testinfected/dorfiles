local wk = require("which-key")

wk.setup {
  window = {
    border = "rounded", -- none, single, double, shadow
    align = 'center',
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
  },
}

wk.register({
  ["<leader>k"] = {
      name = "+keymaps",
      s = { function() vim.cmd "WhichKey" end, "Show", },
      l = { function() local input = vim.fn.input "WhichKey: " vim.cmd("WhichKey " .. input) end, "Lookup..." }
  },
})