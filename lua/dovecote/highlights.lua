local M = {}

---@param colors dovecote.palette
---@param config dovecote.config
M.set_highlights = function(colors, config)
  vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg_focus[1], fg = colors.fg_focus[1] })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = colors.bg_blur[1], fg = colors.fg_blur[1] })
  vim.api.nvim_set_hl(0, "NormalFloat", { link = "NormalNC" })

  vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.bg_focus[2], fg = colors.fg_focus[2] })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = colors.bg_blur[3], fg = colors.fg_blur[3] })
  vim.api.nvim_set_hl(0, "WinBar", { bg = colors.bg_focus[2], fg = colors.fg_focus[2] })
  vim.api.nvim_set_hl(0, "WinBarNC", { bg = colors.bg_blur[3], fg = colors.fg_blur[3] })

  vim.api.nvim_set_hl(0, "Visual", { bg = colors.bg_focus[3] })

  vim.api.nvim_set_hl(0, "ColorColumn", { bg = colors.bg_focus[2] })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.bg_focus[2] })
  vim.api.nvim_set_hl(0, "CursorColumn", { link = "ColorColumn" })

  vim.api.nvim_set_hl(0, "LineNr", { bg = colors.bg_focus[2], fg = colors.fg_focus[2] })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = colors.bg_focus[3], fg = colors.fg_focus[3] })
  vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })

  vim.api.nvim_set_hl(0, "CursorLineFold", { link = "CursorLineNr" })
  vim.api.nvim_set_hl(0, "Folded", { bg = colors.bg_blur[1], fg = colors.fg_focus[1] })

  vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg_focus[3] })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.fg_focus[3] })

  vim.api.nvim_set_hl(0, "Conceal", { fg = colors.bg_focus[3] })
  vim.api.nvim_set_hl(0, "NonText", { fg = colors.bg_focus[3] })

  vim.api.nvim_set_hl(0, "Search", { bg = colors.bg_focus[3] });
  vim.api.nvim_set_hl(0, "CurSearch", { reverse = true });
  vim.api.nvim_set_hl(0, "IncSearch", { link = "CurSearch" });

  vim.api.nvim_set_hl(0, "Directory", { fg = colors.blue });

  vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.green });
  vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.blue });
  vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.red });
  vim.api.nvim_set_hl(0, "DiffText", { bg = colors.bg_focus[3] });

  vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.red });
  vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.orange });
  vim.api.nvim_set_hl(0, "ModeMsg", { fg = colors.blue });
  vim.api.nvim_set_hl(0, "MoreMsg", { link = "ModeMsg" });
  vim.api.nvim_set_hl(0, "Question", { fg = colors.blue });
  vim.api.nvim_set_hl(0, "QuickFixLine", { fg = colors.blue });
  vim.api.nvim_set_hl(0, "Title", { bold = true });

  vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = colors.red })
  vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = colors.blue })
  vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = colors.orange })
  vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = colors.yellow })

  vim.api.nvim_set_hl(0, "MatchParen", { bold = true, fg = colors.blue })
end

return M
