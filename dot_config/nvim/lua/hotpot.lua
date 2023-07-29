-- This hotpot.lua file will clone hotpot (the fennel compiler) into the plugins directory
-- if it missing

-- Fennel code goes to fnl/

local hotpot_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/hotpot.nvim'

if vim.fn.empty(vim.fn.glob(hotpot_path)) > 0 then
  print("Hotpot not installed, cloning to", hotpot_path)
  vn.fn.system({'git', 'clone', 'https://github.com/rktjmp/hotpot.nvim', hotpot_path})
  vim.cmd("helptags" .. hotpoth_path .. "/doc")
end
