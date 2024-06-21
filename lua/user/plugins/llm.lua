return {
	"melbaldove/llm.nvim",
	dependencies = { "nvim-neotest/nvim-nio" },
	config = function()
		vim.keymap.set("n", "<leader>m", function()
			require("llm").create_llm_md()
		end)

		-- keybinds for prompting with groq
		vim.keymap.set("n", "<leader>,", function()
			require("llm").prompt({ replace = false, service = "groq" })
		end)
		vim.keymap.set("v", "<leader>,", function()
			require("llm").prompt({ replace = false, service = "groq" })
		end)
		vim.keymap.set("v", "<leader>.", function()
			require("llm").prompt({ replace = true, service = "groq" })
		end)
	end,
}
