require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		go = { "goimports", "gofmt" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd" } },
		javascriptreact = { { "prettierd" } },
		typescript = { { "prettierd" } },
		typescriptreact = { { "prettierd" } },
	},
	format_on_save = function(bufnr)
		-- These options will be passed to conform.format()
		local ignore_filetypes = { "java" }
		if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
			return
		end
		return {
			timeout_ms = 500,
			lsp_fallback = true,
		}
	end,
})
