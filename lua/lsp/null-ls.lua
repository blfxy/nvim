local OK, null_ls = pcall(require, "null-ls")
if not OK then
	print("找不到 null-ls")
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- 指定方式化方式
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = true,
	sources = {
		formatting.stylua,
		formatting.rustfmt,
		formatting.markdownlint,
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"html",
				"json",
				"less",
				"scss",
				"vue",
			},
			-- prefer_local = "node_modules/.bin",
		}),

		-- code_actions.eslint,
		-- diagnostics.eslint,
		-- code_actions.gitsigns,

		-- require("null-ls").builtins.diagnostics.eslint,
		-- require("null-ls").builtins.completion.spell,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- vim.lsp.buf.format()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
