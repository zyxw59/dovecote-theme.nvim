---@class dovecote.autoblur

local M = {}

---@class dovecote.autoblur.namespaces
---@field focus integer
---@field blur integer

---@return dovecote.autoblur.namespaces
local create_namespaces = function()
  return {
    focus = vim.api.nvim_create_namespace("dovecote-focus"),
    blur = vim.api.nvim_create_namespace("dovecote-blur"),
  }
end

---@param winid integer
---@param namespaces dovecote.autoblur.namespaces
M.blur_window = function(winid, namespaces)
  vim.api.nvim_win_set_hl_ns(winid, namespaces.blur)
end

---@param winid integer
---@param namespaces dovecote.autoblur.namespaces
M.focus_window = function(winid, namespaces)
  vim.api.nvim_win_set_hl_ns(winid, namespaces.focus)
end

---@param namespaces dovecote.autoblur.namespaces
local create_autocommands = function(namespaces)
  vim.api.nvim_create_autocmd({ "WinEnter" }, {
    pattern = { "*" },
    callback = function()
      M.focus_window(0, namespaces)
    end,
  })
  vim.api.nvim_create_autocmd({ "WinNew", "WinLeave" }, {
    pattern = { "*" },
    callback = function()
      M.blur_window(0, namespaces)
    end,
  })
end

---@param namespaces dovecote.autoblur.namespaces
M.apply_all = function(namespaces)
  local current_win = vim.api.nvim_get_current_win()
  for _, tabpage in ipairs(vim.api.nvim_list_tabpages()) do
    if vim.api.nvim_tabpage_is_valid(tabpage) then
      for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabpage)) do
        if vim.api.nvim_win_is_valid(winid) then
          if winid == current_win then
            M.focus_window(winid, namespaces)
          else
            M.blur_window(winid, namespaces)
          end
        end
      end
    end
  end
end

---@param config dovecote.config
---@return dovecote.autoblur.namespaces
M.setup = function(config)
  if config.autoblur then
    local namespaces = create_namespaces()
    create_autocommands(namespaces)
    vim.schedule(function() M.apply_all(namespaces) end)
    return namespaces
  else
    return { focus = -1, blur = -1 }
  end
end

return M
