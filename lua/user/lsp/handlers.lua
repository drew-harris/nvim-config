local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		underline = {
			severity = { min = vim.diagnostic.severity.HINT },
		},
		virtual_text = {
			severity = { min = vim.diagnostic.severity.WARN },
		},
		signs = {
			active = signs, -- show signs
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

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		update_in_insert = true,
	})
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gR", '<cmd>lua require("trouble").toggle("lsp_references")<CR>', opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float({focusable = false})<CR>", opts)
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
	-- TODO: Create command to auto import thing under cursor
	-- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>CodeActionMenu<cr>", opts)
	-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- keymap(bufnr, "i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	keymap(bufnr, "n", "<leader>lc", "<cmd>Lspsaga peek_definition<CR>", opts)
end

local ih = require("inlay-hints")
ih.setup({
	renderer = "inlay-hints/render/eol",
	eol = {
		-- whether to align to the extreme right or not
		right_align = false,
		-- padding from the right if right_align is true
		right_align_padding = 7,
		parameter = {
			separator = ", ",
			format = function(hints)
				return string.format("     (%s)", hints)
			end,
		},
		type = {
			separator = ", ",
			format = function(hints)
				return string.format("     (%s)", hints)
			end,
		},
	},
})

M.on_attach = function(client, bufnr)
	require("lsp-inlayhints").on_attach(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.semanticTokensProvider = false
	end

	if client.name == "lua_ls" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.semanticTokensProvider = false
	end

	if client.name == "rust_analyzer" then
		ih.on_attach(client, bufnr)
	end

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

	-- require("lsp_signature").on_attach({
	-- 	handler_opts = {
	-- 		border = "rounded",
	-- 	},
	-- 	close_timeout = 2000,
	-- 	hint_prefix = " ",
	-- 	toggle_key = "<C-s>",
	-- }, bufnr)

	lsp_keymaps(bufnr)
	-- local status_ok, illuminate = pcall(require, "illuminate")
	-- if not status_ok then
	-- 	return
	-- end

	-- illuminate.on_attach(client)
end

return M
