---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nightfox",
  nvdash = {
    load_on_startup = true,
  },

  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "block",
    overriden_modules = nil,
  },

  transparency = true,
}

M.plugins = "custom.plugins"

return M
