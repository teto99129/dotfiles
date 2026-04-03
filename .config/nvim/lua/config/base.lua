vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 1

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2 
vim.keymap.set('n', 'dd', '"_dd')

vim.keymap.set('n', '<C-e>', ':Ex')
-- vim.keymap.set('n', '<C-n>', ':tabnew<cr>')
--vim.keymap.set('n', '<C-w>', ':tabclose')

vim.api.nvim_create_user_command("Ex", "NvimTreeToggle", {})

local function paste() 
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = paste,
    ['*'] = paste,
  }
}

vim.o.clipboard = "unnamedplus"

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
