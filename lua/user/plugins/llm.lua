return {
	"yacineMTB/dingllm.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local system_prompt =
			"You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks"
		local helpful_prompt =
			"You are a helpful assistant. What I have sent are my notes so far. You are very curt, yet helpful."
		local dingllm = require("dingllm")

		local function anthropic_replace()
			dingllm.invoke_llm_and_stream_into_editor({
				url = "https://api.anthropic.com/v1/messages",
				model = "claude-3-5-sonnet-20240620",
				api_key_name = "ANTHROPIC_API_KEY",
				system_prompt = system_prompt,
				replace = true,
			}, dingllm.make_anthropic_spec_curl_args, dingllm.handle_anthropic_spec_data)
		end

		local function openai_help()
			dingllm.invoke_llm_and_stream_into_editor({
				url = "https://openrouter.ai/api/v1/chat/completions",
				model = "anthropic/claude-3.5-sonnet",
				api_key_name = "OPENROUTER_API_KEY",
				system_prompt = system_prompt,
				replace = false,
			}, dingllm.make_openai_spec_curl_args, dingllm.handle_openai_spec_data)
		end

		vim.keymap.set("v", "<leader>.", openai_help, { desc = "anthropic_replace" })
	end,
}

-- vim.keymap.set("n", "<leader>m", function()
-- 	require("llm").create_llm_md()
-- end)
--
-- -- keybinds for prompting with groq
-- vim.keymap.set("n", "<leader>,", function()
-- 	require("llm").prompt({ replace = false, service = "groq" })
-- end)
-- vim.keymap.set("v", "<leader>,", function()
-- 	require("llm").prompt({ replace = false, service = "groq" })
-- end)
