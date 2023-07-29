--[[
  File: oxcarbon.lua
  Description: Oxo carbon CMP color customizations
  See: https://github.com/nyoom-engineering/oxocarbon.nvim/blob/main/lua/oxocarbon/init.lua
]]

local _local_1_ = require("oxocarbon.colorutils")
local blend_hex = _local_1_["blend-hex"]

local base00 = "#161616"
local base06 = "#ffffff"
local base09 = "#78a9ff"

local oxocarbon = (((vim.o.background == "dark") and {base00 = base00, base01 = blend_hex(base00, base06, 0.085), base02 = blend_hex(base00, base06, 0.18), base03 = blend_hex(base00, base06, 0.3), base04 = blend_hex(base00, base06, 0.82), base05 = blend_hex(base00, base06, 0.95), base06 = base06, base07 = "#08bdba", base08 = "#3ddbd9", base09 = base09, base10 = "#ee5396", base11 = "#33b1ff", base12 = "#ff7eb6", base13 = "#42be65", base14 = "#be95ff", base15 = "#82cfff", blend = "#131313", none = "NONE"}) or {base00 = base06, base01 = blend_hex(base00, base06, 0.95), base02 = blend_hex(base00, base06, 0.82), base03 = base00, base04 = "#37474F", base05 = "#90A4AE", base06 = "#525252", base07 = "#08bdba", base08 = "#ff7eb6", base09 = "#ee5396", base10 = "#FF6F00", base11 = "#0f62fe", base12 = "#673AB7", base13 = "#42be65", base14 = "#be95ff", base15 = "#FFAB91", blend = "#FAFAFA", none = "NONE"})

vim.api.nvim_set_hl(0, "CmpItemKindInterface", {fg = oxocarbon.base08, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindColor", {fg = oxocarbon.base08, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", {fg = oxocarbon.base08, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindText", {fg = oxocarbon.base09, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindEnum", {fg = oxocarbon.base09, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", {fg = oxocarbon.base09, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindConstant", {fg = oxocarbon.base10, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", {fg = oxocarbon.base10, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindReference", {fg = oxocarbon.base10, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindFunction", {fg = oxocarbon.base11, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindStruct", {fg = oxocarbon.base11, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindClass", {fg = oxocarbon.base11, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindModule", {fg = oxocarbon.base11, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindOperator", {fg = oxocarbon.base11, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindField", {fg = oxocarbon.base12, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindProperty", {fg = oxocarbon.base12, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindEvent", {fg = oxocarbon.base12, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindUnit", {fg = oxocarbon.base13, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", {fg = oxocarbon.base13, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindFolder", {fg = oxocarbon.base13, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindVariable", {fg = oxocarbon.base14, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindFile", {fg = oxocarbon.base14, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindMethod", {fg = oxocarbon.base15, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindValue", {fg = oxocarbon.base15, bg = oxocarbon.none})
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", {fg = oxocarbon.base15, bg = oxocarbon.none})
