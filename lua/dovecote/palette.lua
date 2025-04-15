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
---@field neutral string

local M = {}

-- (0.2 0 0), (0.3 0 0), (0.4 0 0)
local dark_blur = { "#161616", "#2E2E2E", "#484848" }
-- (0.9 0 0), (0.8 0 0), (0.7 0 0)
local light_blur = { "#DFDFDF", "#BEBEBE", "#9F9F9F" }
-- (0.2 0.05 315), (0.3 0.05 315), (0.4 0.05 315)
local dark_focus = { "#1E0E25", "#37263F", "#52305A" }
-- (0.9 0.05 60), (0.8 0.05 60), (0.7 0.05 60)
local light_focus = { "#F9D8BE", "#D7B79E", "#B69880" }
local base = {
  red = "#CB564D",      -- (0.6 0.15 27)
  blue = "#4080D9",     -- (0.6 0.15 257)
  purple = "#9E62C1",   -- (0.6 0.15 312)
  neutral = "#6E5B77",  -- (0.5 0.05 315)
}

---@type dovecote.palette
M.dovecote_dark = vim.tbl_extend("force", base, {
  bg_blur = dark_blur,
  fg_blur = light_blur,
  bg_focus = dark_focus,
  fg_focus = light_focus,
  orange = "#E18528", -- (0.7 0.15 60)
  yellow = "#DDBC33", -- (0.8 0.15 95)
  green = "#7AAE74",  -- (0.7 0.10 142)
})

M.dovecote_light = vim.tbl_extend("force", base, {
  bg_blur = light_blur,
  fg_blur = dark_blur,
  bg_focus = light_focus,
  fg_focus = dark_focus,
  orange = "#8C541F", -- (0.5 0.10 60)
  yellow = "#948031", -- (0.6 0.10 95)
  green = "#43963C",  -- (0.6 0.15 142)
})

return M
