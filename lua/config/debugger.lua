local dap = require("dap")
local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
vim.keymap.set("n", "<space>tt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<space>tc", dap.continue, {})
