-- ~/.config/nvim/lua/plugins/clipbard.lua
local M = {}

local function sync_with_system_clipboard(key)
  return function()
    -- Store the current unnamed register
    local old_unnamed = vim.fn.getreg('"')
    
    -- Execute the normal command
    vim.cmd('normal! ' .. key)
    
    -- Get the new content of the unnamed register
    local new_unnamed = vim.fn.getreg('"')
    
    -- If the content has changed, copy to system clipboard
    if old_unnamed ~= new_unnamed then
      vim.fn.setreg('+', new_unnamed)
    end
  end
end

function M.setup()
  -- Map keys in normal and visual mode
  local keys = { 'y', 'Y', 'd', 'D', 'c', 'C', 'x', 'X' }
  for _, key in ipairs(keys) do
    vim.keymap.set({'n', 'v'}, key, sync_with_system_clipboard(key), {noremap = true, silent = true})
  end
end

return M
