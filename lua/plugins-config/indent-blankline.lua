local OK, indent_blankline = pcall(require, 'indent_blankline')
if not OK then
        print("找不到 indent_blankline")
        return
end
-- indent_blankline.setup({
--   char = '|',
--   show_trailing_blankline_indent = false,
--   show_first_indent_level = false,
--   use_treesitter = true,
--   show_current_context = false
-- })
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- require("indent_blankline").setup {
--     space_char_blankline = " ",
--     show_current_context = true,
--     show_current_context_start = true,
-- }
