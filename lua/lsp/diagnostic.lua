---
-- 自定义lsp诊断提示
---
local sign = function(opts)
	-- See :help sign_define()
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = " " })
sign({ name = "DiagnosticSignWarn", text = " " })
sign({ name = "DiagnosticSignHint", text = " " })
sign({ name = "DiagnosticSignInfo", text = " " })

-- See :help vim.diagnostic.config()
vim.diagnostic.config({
	--显示虚拟诊断信息
	-- virtual_text = false,
	virtual_text = {
		-- source = 'always',
		prefix = "",
		-- Only show virtual text matching the given severity(仅显示与给定严重性匹配的虚拟文本)
		severity = {
			-- Specify a range of severities
			min = vim.diagnostic.severity.ERROR,
		},
	},
	severity_sort = true, --诊断信息严重性排序
	-- 在带有诊断信息的行旁边显示一个标志
	signs = true,
	update_in_insert = true, --在插入模式下编辑时更新诊断
	underline = true, --使用下划线显示诊断位置
	-- 在浮动窗口中显示诊断消息
	float = {
		-- focusable = true,
		-- style = "minimal",
		border = "rounded",
		-- 显示诊断信息来源
		source = "always",
		-- header = '',
		-- prefix = '',
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "dn", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
