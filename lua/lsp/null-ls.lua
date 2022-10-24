local OK, null_ls = pcall(require, 'null-ls')
if not OK then
	print("找不到 null-ls")
	return
end
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.rustfmt,

		-- require("null-ls").builtins.diagnostics.eslint,
		-- require("null-ls").builtins.completion.spell,
	},
	on_attach = function(_)
		-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
		-- if client.resolved_capabilities.document_formatting then
		--   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- end
	end,
})
