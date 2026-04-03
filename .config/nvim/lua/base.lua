vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 1

vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.keymap.set('n', 'dd', '"_dd')

vim.keymap.set('n', '<C-n>', ':Tex')
vim.keymap.set('n', '<C-e>', ':Vex')
vim.keymap.set('n', '<C-n>', ':tabnew<cr>')
vim.keymap.set('n', '<C-w>', ':tabclose')


