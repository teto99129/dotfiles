local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

vim.g.mapleader = ","

-- 実行系（Fキー）
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)

-- ブレークポイント
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)

-- 停止
vim.keymap.set("n", "<leader>dq", dap.terminate)

-- REPL
vim.keymap.set("n", "<leader>dr", dap.repl.open)

-- UI
vim.keymap.set("n", "<leader>du", dapui.toggle)

