---@class dovecote.airline

---@class dovecote.airline.theme: { [string]: dovecote.airline.mode }

---@class dovecote.airline.mode
---@field a vim.api.keyset.highlight?
---@field b vim.api.keyset.highlight?
---@field c vim.api.keyset.highlight?
---@field x vim.api.keyset.highlight?
---@field y vim.api.keyset.highlight?
---@field z vim.api.keyset.highlight?
---@field warning vim.api.keyset.highlight?
---@field error vim.api.keyset.highlight?

local M = {}

---@param mode dovecote.airline.mode
local fill_xyz_from_abc = function(mode)
  mode.x = mode.x or vim.deepcopy(mode.c)
  mode.y = mode.y or vim.deepcopy(mode.b)
  mode.z = mode.z or vim.deepcopy(mode.a)
end

---@param colors dovecote.palette
---@return dovecote.airline.theme
M.palette = function(colors)
  local theme = {
    normal = {
      a = {
        fg = colors.fg_focus[3], bg = colors.bg_focus[3], gui = "bold",
        ctermfg = "Black", ctermbg = "LightGray",
      },
      b = {
        fg = colors.fg_focus[2], bg = colors.bg_focus[2],
        ctermfg = "Black", ctermbg = "LightGray",
      },
      c = {
        fg = colors.fg_focus[1], bg = colors.neutral,
        ctermfg = "Black", ctermbg = "LightGray",
      },
      z = {
        fg = colors.fg_focus[3], bg = colors.bg_focus[3],
        ctermfg = "Black", ctermbg = "LightGray",
      },
      error = {
        fg = colors.fg_focus[1], bg = colors.red, gui = "bold",
        ctermfg = "White", ctermbg = "Red",
      },
      warning = {
        fg = colors.fg_focus[1], bg = colors.orange, gui = "bold",
        ctermfg = "White", ctermbg = "DarkRed",
      },
    },
    inactive = {
      a = {
        fg = colors.fg_blur[3], bg = colors.bg_blur[3], gui = "bold",
        ctermfg = "Black", ctermbg = "LightGray",
      },
      b = {
        fg = colors.fg_blur[2], bg = colors.bg_blur[2],
        ctermfg = "Black", ctermbg = "LightGray",
      },
      c = {
        fg = colors.fg_blur[1], bg = colors.bg_blur[1],
        ctermfg = "Black", ctermbg = "LightGray",
      },
      z = {
        fg = colors.fg_blur[3], bg = colors.bg_blur[3],
        ctermfg = "Black", ctermbg = "LightGray",
      },
    },
  }
  fill_xyz_from_abc(theme.normal)
  fill_xyz_from_abc(theme.inactive)
  theme.insert = vim.deepcopy(theme.normal)
  theme.insert.a = {
    fg = colors.bg_focus[1], bg = colors.green, gui = "bold",
    ctermfg = "White", ctermbg = "Green",
  }
  theme.visual = vim.deepcopy(theme.normal)
  theme.visual.a = {
    fg = colors.fg_focus[1], bg = colors.blue, gui = "bold",
    ctermfg = "White", ctermbg = "Blue",
  }
  theme.replace = vim.deepcopy(theme.normal)
  theme.replace.a = {
    fg = colors.fg_focus[1], bg = colors.orange, gui = "bold",
    ctermfg = "White", ctermbg = "DarkRed",
  }
  theme.command = vim.deepcopy(theme.normal)
  theme.command.a = {
    fg = colors.fg_focus[1], bg = colors.purple, gui = "bold",
    ctermfg = "White", ctermbg = "DarkMagenta",
  }
  return theme
end

---@return (string|integer)[]
local airline_highlight = function(highlight)
  return {
    highlight.fg or "",
    highlight.bg or "",
    highlight.ctermfg or "",
    highlight.ctermbg or "",
    highlight.gui or "",
  }
end

---@param colors dovecote.palette
---@return { [string]: (string|integer)[] }
M.airline = function(colors)
  local theme = M.palette(colors)
  return vim.tbl_map(function(mode)
    local airline_mode = {}
    for k,v in pairs(mode) do
      airline_mode["airline_" .. k] = airline_highlight(v)
    end
    return airline_mode
  end, theme)
end

return M
