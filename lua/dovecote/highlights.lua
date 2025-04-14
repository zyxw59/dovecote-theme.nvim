local M = {}

--- Built-In highlighting groups (:h highlight-groups)
---@param colors dovecote.palette
---@param config dovecote.config
local set_highlights_builtin = function(colors, config)
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
  vim.api.nvim_set_hl(0, "Folded", { bg = colors.bg_focus[3], fg = colors.fg_focus[1] })

  vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg_focus[3] })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.fg_focus[3] })

  vim.api.nvim_set_hl(0, "Conceal", { fg = colors.neutral })
  vim.api.nvim_set_hl(0, "NonText", { fg = colors.neutral })

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

--- Syntax highlight groups (:h group-name)
local set_highlights_syntax = function(colors, config)
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.neutral, italic = true })

  vim.api.nvim_set_hl(0, "Constant", { fg = colors.purple })
  vim.api.nvim_set_hl(0, "String", { fg = colors.purple })

  vim.api.nvim_set_hl(0, "Identifier", {})
  vim.api.nvim_set_hl(0, "Function", {})

  vim.api.nvim_set_hl(0, "Statement", { bold = true })
  vim.api.nvim_set_hl(0, "Operator", { link = "Statement" })

  vim.api.nvim_set_hl(0, "PreProc", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "Include", { fg = colors.yellow })

  vim.api.nvim_set_hl(0, "Type", { fg = colors.green })
  vim.api.nvim_set_hl(0, "Structure", { link = "Statement" })

  vim.api.nvim_set_hl(0, "Special", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "SpecialChar", { fg = colors.fg_focus[1] })
  vim.api.nvim_set_hl(0, "Delimiter", {})
  vim.api.nvim_set_hl(0, "SpecialComment", { link = "Statement" })

  vim.api.nvim_set_hl(0, "Error", { fg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, "Todo", { fg = colors.orange, bold = true })

  vim.api.nvim_set_hl(0, "Added", { link = "DiffAdd" });
  vim.api.nvim_set_hl(0, "Changed", { link = "DiffChange" });
  vim.api.nvim_set_hl(0, "Removed", { link = "DiffDelete" });
end

--- Diagnostic highlighting groups (:h diagnostic-highlights)
local set_highlights_diagnostic = function(colors, config)
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
local set_highlights_treesitter = function(colors, config)
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
  vim.api.nvim_set_hl(0, "@comment.documentation", { fg = colors.fg_focus[3], nocombine = true })

  vim.api.nvim_set_hl(0, "@comment.error", { link = "DiagnosticError" })
  vim.api.nvim_set_hl(0, "@comment.warning", { link = "DiagnosticWarn" })
  vim.api.nvim_set_hl(0, "@comment.todo", { link = "Todo" })
  vim.api.nvim_set_hl(0, "@comment.note", { link = "DiagnosticInfo" })

  vim.api.nvim_set_hl(0, "@markup.quote", { link = "String" })

  vim.api.nvim_set_hl(0, "@character.special.vim", { link = "Special" })
end

--- Treesitter context highlighting groups (:h treesitter-context-highlights)
local set_highlights_treesitter_context = function(colors, config)
  vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Folded" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "CursorLineNr" })
end

--- LSP semantic highlighting groups (:h lsp-semantic-highlight)
local set_highlights_lsp = function(colors, config)
  vim.api.nvim_set_hl(0, "@lsp.type.interface", { link = "Special" })
  vim.api.nvim_set_hl(0, "@lsp.type.builtinType", { link = "@type.builtin" })
  vim.api.nvim_set_hl(0, "@lsp.type.macro", { link = "PreProc" })

  vim.api.nvim_set_hl(0, "@lsp.mod.documentation", { link = "@comment.documentation" })
end

---@param colors dovecote.palette
---@param config dovecote.config
M.set_highlights = function(colors, config)
  set_highlights_builtin(colors, config)
  set_highlights_syntax(colors, config)
  set_highlights_diagnostic(colors, config)
  set_highlights_treesitter(colors, config)
  set_highlights_treesitter_context(colors, config)
  set_highlights_lsp(colors, config)
end

return M
