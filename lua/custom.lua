local M = {}
function M.setup()
  vim.opt.tabstop = 1
  vim.opt.autoindent = false
  vim.opt.smartindent = false
  vim.opt.cindent = false

  vim.opt.shiftwidth = 1
end

return M
