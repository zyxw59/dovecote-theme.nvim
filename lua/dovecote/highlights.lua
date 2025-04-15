local M = {}


---@param colors dovecote.palette
---@param is_fg boolean
---@param is_focus boolean
---@return string[]
local get_color_set = function(colors, is_fg, is_focus)
  if is_fg then
    if is_focus then
      return colors.fg_focus
    else
      return colors.fg_blur
    end
  else
    if is_focus then
      return colors.bg_focus
    else
      return colors.bg_blur
    end
  end
end

---@class dovecote.highlights.highlight_group
---@field fg integer?
---@field bg integer?
---@field reverse boolean?
---@field style vim.api.keyset.highlight?

---@param colors dovecote.palette
---@param group_val dovecote.highlights.highlight_group
---@param is_focus boolean
---@return vim.api.keyset.highlight
local make_hl_group = function(colors, group_val, is_focus)
  local style = group_val.style or {}
  local reverse = group_val.reverse or false
  if group_val.fg then
    style.fg = get_color_set(colors, not reverse, is_focus)[group_val.fg]
  end
  if group_val.bg then
    style.bg = get_color_set(colors, reverse, is_focus)[group_val.bg]
  end
  return style
end

---@param colors dovecote.palette
---@param config dovecote.config
---@param namespaces dovecote.autoblur.namespaces
---@param group string
---@param group_val dovecote.highlights.highlight_group
local set_hl_maybe_blur = function(colors, config, namespaces, group, group_val)
  if config.autoblur then
    vim.api.nvim_set_hl(namespaces.focus, group, make_hl_group(colors, group_val, true))
    vim.api.nvim_set_hl(namespaces.blur, group, make_hl_group(colors, group_val, false))
  else
    vim.api.nvim_set_hl(0, group, make_hl_group(colors, group_val, true))
  end
end

--- Built-In highlighting groups (:h highlight-groups)
---@param colors dovecote.palette
---@param config dovecote.config
---@param namespaces dovecote.autoblur.namespaces
local set_highlights_builtin = function(colors, config, namespaces)
  set_hl_maybe_blur(colors, config, namespaces, "Normal", { bg = 1, fg = 1})
  vim.api.nvim_set_hl(0, "NormalNC", { bg = colors.bg_blur[1], fg = colors.fg_blur[1] })
  if config.autoblur then
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  else
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "NormalNC" })
  end

  set_hl_maybe_blur(colors, config, namespaces, "StatusLine", { bg = 2, fg = 2 })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = colors.bg_blur[3], fg = colors.fg_blur[3] })
  set_hl_maybe_blur(colors, config, namespaces, "WinBar", { bg = 2, fg = 2 })
  vim.api.nvim_set_hl(0, "WinBarNC", { bg = colors.bg_blur[3], fg = colors.fg_blur[3] })

  set_hl_maybe_blur(colors, config, namespaces, "Visual", { bg = 3 })

  set_hl_maybe_blur(colors, config, namespaces, "ColorColumn", { bg = 2 })
  set_hl_maybe_blur(colors, config, namespaces, "CursorLine", { bg = 2 })
  vim.api.nvim_set_hl(0, "CursorColumn", { link = "ColorColumn" })

  set_hl_maybe_blur(colors, config, namespaces, "LineNr", { bg = 2, fg = 2 })
  set_hl_maybe_blur(colors, config, namespaces, "CursorLineNr", { bg = 3, fg = 3 })
  vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })

  vim.api.nvim_set_hl(0, "CursorLineFold", { link = "CursorLineNr" })
  set_hl_maybe_blur(colors, config, namespaces, "Folded", { bg = 3, fg = 1 })

  set_hl_maybe_blur(colors, config, namespaces, "Pmenu", { bg = 3 })
  set_hl_maybe_blur(colors, config, namespaces, "PmenuThumb", { bg = 3, reverse = true })

  vim.api.nvim_set_hl(0, "Conceal", { fg = colors.neutral })
  vim.api.nvim_set_hl(0, "NonText", { fg = colors.neutral })

  set_hl_maybe_blur(colors, config, namespaces, "Search", { bg = 3 })
  vim.api.nvim_set_hl(0, "CurSearch", { reverse = true })
  vim.api.nvim_set_hl(0, "IncSearch", { link = "CurSearch" })

  vim.api.nvim_set_hl(0, "Directory", { fg = colors.blue })

  vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.green })
  vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.red })
  set_hl_maybe_blur(colors, config, namespaces, "DiffText", { bg = 3 })

  vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.red })
  vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.orange })
  vim.api.nvim_set_hl(0, "ModeMsg", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "MoreMsg", { link = "ModeMsg" })
  vim.api.nvim_set_hl(0, "Question", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "QuickFixLine", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "Title", { bold = true })

  vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = colors.red })
  vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = colors.blue })
  vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = colors.orange })
  vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = colors.yellow })

  vim.api.nvim_set_hl(0, "MatchParen", { bold = true, fg = colors.blue })
end

--- Syntax highlight groups (:h group-name)
local set_highlights_syntax = function(colors, config, namespaces)
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.neutral, italic = true })

  vim.api.nvim_set_hl(0, "Constant", { fg = colors.purple })
  vim.api.nvim_set_hl(0, "String", { fg = colors.purple })

  vim.api.nvim_set_hl(0, "Identifier", {})
  vim.api.nvim_set_hl(0, "Function", { fg = colors.orange })

  vim.api.nvim_set_hl(0, "Statement", { bold = true })
  vim.api.nvim_set_hl(0, "Operator", { link = "Statement" })

  vim.api.nvim_set_hl(0, "PreProc", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "Include", { fg = colors.yellow })

  vim.api.nvim_set_hl(0, "Type", { fg = colors.green })
  vim.api.nvim_set_hl(0, "Structure", { link = "Statement" })

  vim.api.nvim_set_hl(0, "Special", { fg = colors.blue })
  set_hl_maybe_blur(colors, config, namespaces, "MaybeBlur", { fg = 1 })
  vim.api.nvim_set_hl(0, "Delimiter", {})
  vim.api.nvim_set_hl(0, "SpecialComment", { link = "Statement" })

  vim.api.nvim_set_hl(0, "Error", { fg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, "Todo", { fg = colors.orange, bold = true })

  vim.api.nvim_set_hl(0, "Added", { link = "DiffAdd" })
  vim.api.nvim_set_hl(0, "Changed", { link = "DiffChange" })
  vim.api.nvim_set_hl(0, "Removed", { link = "DiffDelete" })
end

--- Diagnostic highlighting groups (:h diagnostic-highlights)
local set_highlights_diagnostic = function(colors, config, namespaces)
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.orange })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticOk", { fg = colors.green })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.orange })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { undercurl = true, sp = colors.green })
  vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { italic = true })
end

--- Treesitter highlighting groups (:h treesitter-highlight-groups)
local set_highlights_treesitter = function(colors, config, namespaces)
  vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
  vim.api.nvim_set_hl(0, "@variable.builtin", { link = "Special" })
  vim.api.nvim_set_hl(0, "@variable.parameter.builtin", { link = "@variable.builtin" })

  vim.api.nvim_set_hl(0, "@constant", { link = "Constant"})
  vim.api.nvim_set_hl(0, "@constant.builtin", { link = "Constant"})
  vim.api.nvim_set_hl(0, "@constant.macro", { link = "Constant"})

  vim.api.nvim_set_hl(0, "@module", { link = "Structure"})
  vim.api.nvim_set_hl(0, "@module.builtin", { link = "Structure"})
  vim.api.nvim_set_hl(0, "@label", { link = "Label" })

  vim.api.nvim_set_hl(0, "@string", { link = "String" })
  vim.api.nvim_set_hl(0, "@string.documentation", { link = "@comment.documentation" })
  vim.api.nvim_set_hl(0, "@string.regexp", { link = "String" })
  vim.api.nvim_set_hl(0, "@string.escape", { link = "SpecialChar" })
  vim.api.nvim_set_hl(0, "@string.special", { link = "String" })

  vim.api.nvim_set_hl(0, "@character", { link = "Character" })
  vim.api.nvim_set_hl(0, "@character.special", { link = "SpecialChar" })

  vim.api.nvim_set_hl(0, "@boolean", { link = "Boolean" })
  vim.api.nvim_set_hl(0, "@number", { link = "Number" })
  vim.api.nvim_set_hl(0, "@number.float", { link = "Float" })

  vim.api.nvim_set_hl(0, "@type", { link = "Type" })
  vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })
  vim.api.nvim_set_hl(0, "@attribute", { link = "PreProc" })
  vim.api.nvim_set_hl(0, "@attribute.builtin", { link = "PreProc" })
  vim.api.nvim_set_hl(0, "@property", { link = "Identifier" })

  vim.api.nvim_set_hl(0, "@function", { link = "Function" })
  vim.api.nvim_set_hl(0, "@function.builtin", { link = "Function" })

  vim.api.nvim_set_hl(0, "@constructor", { link = "Constructor" })
  vim.api.nvim_set_hl(0, "@operator", { link = "Operator" })

  vim.api.nvim_set_hl(0, "@keyword", { link = "Keyword" })
  vim.api.nvim_set_hl(0, "@Exception", { link = "Exception" })
  vim.api.nvim_set_hl(0, "@keyword.conditional.ternary", { link = "Operator" })
  vim.api.nvim_set_hl(0, "@keyword.directive", { link = "PreProc" })

  vim.api.nvim_set_hl(0, "@punctuation", { link = "Delimiter" })
  vim.api.nvim_set_hl(0, "@punctuation.special", { link = "Special" })

  vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
  set_hl_maybe_blur(colors, config, namespaces, "@comment.documentation", {
    fg = 3,
    style = { nocombine = true },
  })

  vim.api.nvim_set_hl(0, "@comment.error", { link = "DiagnosticError" })
  vim.api.nvim_set_hl(0, "@comment.warning", { link = "DiagnosticWarn" })
  vim.api.nvim_set_hl(0, "@comment.todo", { link = "Todo" })
  vim.api.nvim_set_hl(0, "@comment.note", { link = "DiagnosticInfo" })

  vim.api.nvim_set_hl(0, "@markup.quote", { link = "String" })

  vim.api.nvim_set_hl(0, "@character.special.vim", { link = "Special" })
end

--- Treesitter context highlighting groups (:h treesitter-context-highlights)
local set_highlights_treesitter_context = function(colors, config, namespaces)
  vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Folded" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "CursorLineNr" })
end

--- LSP semantic highlighting groups (:h lsp-semantic-highlight)
local set_highlights_lsp = function(colors, config, namespaces)
  vim.api.nvim_set_hl(0, "@lsp.type.interface", { link = "Special" })
  vim.api.nvim_set_hl(0, "@lsp.type.builtinType", { link = "@type.builtin" })
  vim.api.nvim_set_hl(0, "@lsp.type.macro", { link = "PreProc" })

  vim.api.nvim_set_hl(0, "@lsp.mod.documentation", { link = "@comment.documentation" })
end

---@param colors dovecote.palette
---@param config dovecote.config
---@param namespaces dovecote.autoblur.namespaces
M.set_highlights = function(colors, config, namespaces)
  set_highlights_builtin(colors, config, namespaces)
  set_highlights_syntax(colors, config, namespaces)
  set_highlights_diagnostic(colors, config, namespaces)
  set_highlights_treesitter(colors, config, namespaces)
  set_highlights_treesitter_context(colors, config, namespaces)
  set_highlights_lsp(colors, config, namespaces)
end

return M
