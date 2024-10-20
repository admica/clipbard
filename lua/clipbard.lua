-- ~/.config/nvim/lua/plugins/clipbard.lua

local M = {}

-- Cache the WSL status
local is_wsl = vim.fn.has('wsl') == 1

-- Debounce function to limit clipboard operations
local debounce_timer = nil
local function debounced_sync(data)
  if debounce_timer then
    vim.loop.timer_stop(debounce_timer)
  end
  debounce_timer = vim.defer_fn(function()
    if is_wsl then
      vim.fn.system('clip.exe', data)
    else
      vim.fn.setreg('+', data)
    end
  end, 10) -- 10ms debounce
end

-- Efficient operator function
local function enhanced_operator(op)
  return function()
    local old_reg = vim.fn.getreg('"')
    vim.cmd('silent normal! ' .. op)
    local new_reg = vim.fn.getreg('"')
    if old_reg ~= new_reg then
      debounced_sync(new_reg)
    end
  end
end

function M.setup()
  -- Use a single autocommand for all relevant events
  vim.api.nvim_create_autocmd({"TextYankPost", "TextChanged", "TextChangedI"}, {
    group = vim.api.nvim_create_augroup("Clipbard", { clear = true }),
    callback = function()
      debounced_sync(vim.fn.getreg('"'))
    end,
  })

  -- Map operators
  local ops = { 'y', 'Y', 'd', 'D', 'c', 'C', 'x', 'X', 's', 'S' }
  for _, op in ipairs(ops) do
    vim.keymap.set({'n', 'v'}, op, enhanced_operator(op), {noremap = true, silent = true})
  end
end

return M
