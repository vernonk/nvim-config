vim.api.nvim_create_user_command("CopyRelPath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

require("vk.core")
require("vk.lazy")
