require("taylor.core.options")
require("taylor.core")
require("taylor.lazy")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lazy",
  callback = function()
    vim.keymap.set("n", "<esc>", function() vim.api.nvim_win_close(0, false) end, { buffer = true, nowait = true })
  end,
})
