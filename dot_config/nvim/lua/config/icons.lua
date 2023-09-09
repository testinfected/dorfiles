--[[
  Description: Icon definitions
  See: https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/icons.lua
]]

return {
  kind = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
  },

  debug = {
    Expanded = '',
    Collapsed = '',
    Circular = '',
  },

  git = {
    LineAdded = '',
    LineModified = '',
    LineRemoved = '',
    FileDeleted = '',
    FileIgnored = '◌',
    FileRenamed = '',
    FileStaged = 'S',
    FileUnmerged = '',
    FileUnstaged = '',
    FileUntracked = 'U',
    Diff = '',
    Repo = '',
    Octoface = '',
    Branch = '',
  },

  lsp = {
    Server = ' ',
    Lambda = '󰘧',
    Lua = '',
    Latex = '',
    Test = '',
  },

  file = {
    ReadOnly = '',
    New = '',
    Modified = '',
    Path = '',
  },

  diagnostics = {
    Debug = '',
    Error = '',
    Warning = '',
    Info = '',
    Hint = '',
    Trace = '󰙈',
  },

  ui = {
    RightPill = '',
    LeftPill = '',
    VerticalLine = '|',
    VerticalLineThick = '┃',
    VerticalDottedLine = '',
    VerticalDottedLineThick = '󰇙',
  },
}