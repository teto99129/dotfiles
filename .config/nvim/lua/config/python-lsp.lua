if vim.fn.executable("pyright") == 1 then
  vim.lsp.enable('pyright')
end
