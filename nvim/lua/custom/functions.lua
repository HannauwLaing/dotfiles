local m = {}

m.toggle_format = function()
	local out = ""
	if vim.g.autoformat then
		vim.g.autoformat = false
	else
		vim.g.autoformat = true
	end
	out = vim.g.autoformat == true and "true" or "false"
	vim.notify("Autoformat " .. out, vim.log.levels.info)
end

return m
