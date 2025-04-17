local colors = {}
if vim.o.background == "dark" then
  colors = require("dovecote.palette").dovecote_dark
else
  colors = require("dovecote.palette").dovecote_light
end
return {
  normal = {
    a = { fg = colors.fg_focus[3], bg = colors.bg_focus[3], gui = "bold" },
    b = { fg = colors.fg_focus[2], bg = colors.bg_focus[2] },
    c = { fg = colors.fg_focus[1], bg = colors.neutral },
    z = { fg = colors.fg_focus[3], bg = colors.bg_focus[3] },
  },
  insert = {
    a = { fg = colors.bg_focus[1], bg = colors.green, gui = "bold" },
    z = { fg = colors.fg_focus[3], bg = colors.bg_focus[3] },
  },
  visual = {
    a = { fg = colors.fg_focus[1], bg = colors.blue, gui = "bold" },
    z = { fg = colors.fg_focus[3], bg = colors.bg_focus[3] },
  },
  replace = {
    a = { fg = colors.fg_focus[1], bg = colors.orange, gui = "bold" },
    z = { fg = colors.fg_focus[3], bg = colors.bg_focus[3] },
  },
  command = {
    a = { fg = colors.fg_focus[1], bg = colors.purple, gui = "bold" },
    z = { fg = colors.fg_focus[3], bg = colors.bg_focus[3] },
  },
  inactive = {
    a = { fg = colors.fg_blur[3], bg = colors.bg_blur[3], gui = 'bold' },
    b = { fg = colors.fg_blur[2], bg = colors.bg_blur[2] },
    c = { fg = colors.fg_blur[1], bg = colors.bg_blur[1] },
    z = { fg = colors.fg_blur[3], bg = colors.bg_blur[3] },
  },
}
