local OK, autopairs = pcall(require, "nvim-autopairs")
if not OK then
	print("not found autopairs")
	return
end
autopairs.setup({})
