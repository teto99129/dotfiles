print(vim.fn.executable("gopls"))
if vim.fn.executable("gopls") == 1 then
  vim.lsp.enable("gopls")
end

vim.g.mapleader = ","
vim.keymap.set(
  "n",
  "gd",
  vim.lsp.buf.definition,
  { desc = "Go to definition" }
)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
  end,
})
