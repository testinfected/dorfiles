local wk = require("which-key")

wk.setup {
  window = {
    border = "solid", -- none, single, double, shadow
    align = 'center',
    layout = {
      spacing = 3
    }
  }
}

wk.register({
  ["<leader>k"] = {
      name = "+keymaps",
      s = { function() vim.cmd "WhichKey" end, "Show", },
      l = { function() local input = vim.fn.input "WhichKey: " vim.cmd("WhichKey " .. input) end, "Lookup..." }
  },
})