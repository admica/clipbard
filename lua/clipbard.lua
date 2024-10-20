-- ~/.config/nvim/lua/plugins/clipbard.lua
return {
  "clipbard",
  config = function()
    local function enhance_clipboard(key)
      return function()
        -- Execute the command
        vim.cmd("normal! " .. key)
        -- Copy the unnamed register to the system clipboard
        vim.fn.setreg("+", vim.fn.getreg('"'))
      end
    end

    -- Map keys in normal and visual mode
    local keys = { "y", "Y", "c", "C", "d", "D", "x" }
    for _, key in ipairs(keys) do
      vim.keymap.set({ "n", "v" }, key, enhance_clipboard(key), { noremap = true, silent = true })
    end
  end,
}
