local M = {}

-- local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status_cmp_ok then
-- 	return
-- end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require("blink.cmp").get_lsp_capabilities()

M.setup = function()
	local config = {
		underline = {
			severity = { min = vim.diagnostic.severity.HINT },
		},
		virtual_text = {
			severity = { min = vim.diagnostic.severity.WARN },
		},
		signs = {
			active = true, -- Ensure signs are active
			text = {
				[vim.diagnostic.severity.ERROR] = "", -- Icon for errors
				[vim.diagnostic.severity.WARN] = "", -- Icon for warnings
				[vim.diagnostic.severity.HINT] = "", -- Icon for hints
				[vim.diagnostic.severity.INFO] = "", -- Icon for info
			},
		},
		update_in_insert = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		focusable = true,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		focusable = false,
	})

	-- Define the handler function
	local function custom_publish_diagnostics(err, result, ctx, config)
		require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
		vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
	end

	-- Assign the combined handler function
	vim.lsp.handlers["textDocument/publishDiagnostics"] = custom_publish_diagnostics
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(
		bufnr,
		"n",
		"gR",
		'<cmd>lua require("trouble").toggle("lsp_references")<CR>',
		vim.tbl_extend("force", opts, { desc = "Trouble References" })
	)
	keymap(bufnr, "n", "<leader>la", "<cmd>CodeActionMenu<cr>", opts)
	-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	vim.keymap.set("n", "<leader>lf", function()
		require("conform").format()
	end, opts)
	keymap(bufnr, "n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

	vim.keymap.set("n", "<leader>I", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, { desc = "Toggle Inlay Hints" })
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	keymap(bufnr, "n", "<leader>lc", "<cmd>Lspsaga peek_definition<CR>", opts)

	vim.keymap.set("n", "<leader>lw", function()
		vim.diagnostic.setqflist()
	end, { desc = "Workspace Diagnostics" })
end

M.keymaps = lsp_keymaps

-- local ih = require("inlay-hints")
-- ih.setup({
-- 	renderer = "inlay-hints/render/eol",
-- 	eol = {
-- 		-- whether to align to the extreme right or not
-- 		right_align = false,
-- 		-- padding from the right if right_align is true
-- 		right_align_padding = 7,
-- 		parameter = {
-- 			separator = ", ",
-- 			format = function(hints)
-- 				return string.format("     (%s)", hints)
-- 			end,
-- 		},
-- 		type = {
-- 			separator = ", ",
-- 			format = function(hints)
-- 				return string.format("     (%s)", hints)
-- 			end,
-- 		},
-- 	},
-- })

M.on_attach = function(client, bufnr)
	-- require("lsp-inlayhints").on_attach(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.semanticTokensProvider = true
	end

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.semanticTokensProvider = true
	end

	if client.name == "tinymist" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.semanticTokensProvider = false
	end

	-- if client.name == "rust_analyzer" then
	-- 	ih.on_attach(client, bufnr)
	-- end

	if client.name == "clangd" then
		vim.api.nvim_command("set shiftwidth=4")
		client.server_capabilities.semanticTokensProvider = nil
	end

	if client.name == "jdtls" then
		vim.api.nvim_command("set shiftwidth=4")
	end

	if client.name == "tailwindcss" then
		require("tailwindcss-colors").buf_attach(bufnr)
	end

	if client.name == "graphql" then
		client.server_capabilities.semanticTokensProvider = nil
	end

	lsp_keymaps(bufnr)
	-- local status_ok, illuminate = pcall(require, "illuminate")
	-- if not status_ok then
	-- 	return
	-- end

	-- illuminate.on_attach(client)
end

return M
