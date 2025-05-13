return {
	{
		"copilotlsp-nvim/copilot-lsp",
		enabled = false,
		config = function()
			local function get_copilot_client()
				local clients = vim.lsp.get_clients()
				for _, client in ipairs(clients) do
					if client.name == "copilot" then
						return client
					end
				end
				return nil
			end
			local function request()
				local copilot_client = get_copilot_client()

				if copilot_client ~= nil then
					require("blink.cmp")["hide"]()
					print("Requesting nes")
					require("copilot-lsp.nes").request_nes(copilot_client)
				else
					print("Copilot LSP client not found.")
				end
			end

			vim.g.copilot_nes_debounce = 600

			vim.lsp.enable("copilot")
			vim.keymap.set("i", "<C-k>", function()
				require("blink.cmp")["hide"]()
				require("copilot-lsp.nes").apply_pending_nes()
			end, { desc = "Next edit suggestion" })
			vim.keymap.set("i", "<C-h>", function()
				request()
			end, { desc = "Request Next edit suggestion" })
			vim.keymap.set("n", "<C-k>", function()
				require("blink.cmp")["hide"]()
				require("copilot-lsp.nes").apply_pending_nes()
			end, { desc = "Next edit suggestion" })
			vim.keymap.set("n", "<C-h>", function()
				request()
			end, { desc = "Request Next edit suggestion" })
		end,
	},
	{
		enabled = false,
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({})
		end,
	},
}
