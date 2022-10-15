local OK, indent_blankline = pcall(require, 'indent_blankline')
if not OK then
        print("not found indent_blankline")
        return
end
indent_blankline.setup({
  char = '▏',
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false
})
