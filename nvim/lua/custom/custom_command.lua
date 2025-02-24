vim.keymap.set("n", "<C-L>",
	function()
		require("custom.functions").toggle_format() 
	end,
	{desc = "Toggle auto format"})

vim.api.nvim_create_user_command("TF", 
	function() require("custom.functions").toggle_format() end,
	{})
