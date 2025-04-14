---@class dovecote
---@field config? dovecote.config
---@field setup? fun(config: dovecote.config)
---@field load? fun()

---@type dovecote
local M = {}

M.config = require("dovecote.config")

M.setup = function(config)
  M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

M.load = function()
  -- clear existing highlighting
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "dovecote"

  local highlights = require("dovecote.highlights")
  local palette = require("dovecote.palette")
  local colors = {}
  if vim.o.background == "dark" then
    colors = palette.dovecote_dark
  else
    colors = palette.dovecote_light
  end

  local namespaces = require("dovecote.autoblur").setup(M.config)
  highlights.set_highlights(colors, M.config, namespaces)
end

return M
