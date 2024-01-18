Keymapper = function(pattern, command, description)
	vim.keymap.set("n", "<leader>" .. pattern, command, {
		desc = description,
	})
end
