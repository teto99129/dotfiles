if vim.fn.executable("typescript-language-server") == 1 then
  vim.lsp.enable("ts_ls")
end
