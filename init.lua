require("config.lazy")

-- basic settings
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
