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

local color = (((vim.o.background == "dark") and {base00 = base00, base01 = blend_hex(base00, base06, 0.085), base02 = blend_hex(base00, base06, 0.18), base03 = blend_hex(base00, base06, 0.3), base04 = blend_hex(base00, base06, 0.82), base05 = blend_hex(base00, base06, 0.95), base06 = base06, base07 = "#08bdba", base08 = "#3ddbd9", base09 = base09, base10 = "#ee5396", base11 = "#33b1ff", base12 = "#ff7eb6", base13 = "#42be65", base14 = "#be95ff", base15 = "#82cfff", blend = "#131313", none = "NONE"}) or {base00 = base06, base01 = blend_hex(base00, base06, 0.95), base02 = blend_hex(base00, base06, 0.82), base03 = base00, base04 = "#37474F", base05 = "#90A4AE", base06 = "#525252", base07 = "#08bdba", base08 = "#ff7eb6", base09 = "#ee5396", base10 = "#FF6F00", base11 = "#0f62fe", base12 = "#673AB7", base13 = "#42be65", base14 = "#be95ff", base15 = "#FFAB91", blend = "#FAFAFA", none = "NONE"})

local highlight_color = vim.api.nvim_set_hl

-- Swap fg and bg for kind icons in completion menu
highlight_color(0, "CmpItemKindInterface", {fg = color.base08, bg = color.none})
highlight_color(0, "CmpItemKindColor", {fg = color.base08, bg = color.none})
highlight_color(0, "CmpItemKindTypeParameter", {fg = color.base08, bg = color.none})
highlight_color(0, "CmpItemKindText", {fg = color.base09, bg = color.none})
highlight_color(0, "CmpItemKindEnum", {fg = color.base09, bg = color.none})
highlight_color(0, "CmpItemKindKeyword", {fg = color.base09, bg = color.none})
highlight_color(0, "CmpItemKindConstant", {fg = color.base10, bg = color.none})
highlight_color(0, "CmpItemKindConstructor", {fg = color.base10, bg = color.none})
highlight_color(0, "CmpItemKindReference", {fg = color.base10, bg = color.none})
highlight_color(0, "CmpItemKindFunction", {fg = color.base11, bg = color.none})
highlight_color(0, "CmpItemKindStruct", {fg = color.base11, bg = color.none})
highlight_color(0, "CmpItemKindClass", {fg = color.base11, bg = color.none})
highlight_color(0, "CmpItemKindModule", {fg = color.base11, bg = color.none})
highlight_color(0, "CmpItemKindOperator", {fg = color.base11, bg = color.none})
highlight_color(0, "CmpItemKindField", {fg = color.base12, bg = color.none})
highlight_color(0, "CmpItemKindProperty", {fg = color.base12, bg = color.none})
highlight_color(0, "CmpItemKindEvent", {fg = color.base12, bg = color.none})
highlight_color(0, "CmpItemKindUnit", {fg = color.base13, bg = color.none})
highlight_color(0, "CmpItemKindSnippet", {fg = color.base13, bg = color.none})
highlight_color(0, "CmpItemKindFolder", {fg = color.base13, bg = color.none})
highlight_color(0, "CmpItemKindVariable", {fg = color.base14, bg = color.none})
highlight_color(0, "CmpItemKindFile", {fg = color.base14, bg = color.none})
highlight_color(0, "CmpItemKindMethod", {fg = color.base15, bg = color.none})
highlight_color(0, "CmpItemKindValue", {fg = color.base15, bg = color.none})
highlight_color(0, "CmpItemKindEnumMember", {fg = color.base15, bg = color.none})