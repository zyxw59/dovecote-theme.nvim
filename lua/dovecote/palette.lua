---@class dovecote.palette
---@field fg_focus string[]
---@field bg_focus string[]
---@field fg_blur string[]
---@field bg_blur string[]
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field blue string
---@field purple string

local M = {}

local dark_blur = { "#161616", "#2E2E2E", "#484848" }
local light_blur = { "#DFDFDF", "#BEBEBE", "#9F9F9F" }
local dark_focus = { "#1E0E26", "#37263F", "#52405B" }
local light_focus = { "#F9D8BE", "#D7B89F", "#B79880" }
local base = {
  red = "#CB564D",
  orange = "#E18528",
  green = "#43963C",
  blue = "#4080D9",
  purple = "#9E62C1",
};

---@type dovecote.palette
M.dovecote_dark = vim.tbl_extend("force", base, {
  bg_blur = dark_blur,
  fg_blur = light_blur,
  bg_focus = dark_focus,
  fg_focus = light_focus,
  yellow = "#DDBC33",
})

M.dovecote_light = vim.tbl_extend("force", base, {
  bg_blur = light_blur,
  fg_blur = dark_blur,
  bg_focus = light_focus,
  fg_focus = dark_focus,
  yellow = "#948031",
})

return M
