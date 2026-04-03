if vim.fn.executable("lua_ls") == 1 then
  vim.lsp.enable("lua_ls")
end

