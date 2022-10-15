local OK, gitsigns = pcall(require, "gitsigns")
if not OK then
  print("not found gitsigns")
  return
end
gitsigns.setup({
    signs = {
      add = {text = '▎'},
      change = {text = '▎'},
      delete = {text = '➤'},
      topdelete = {text = '➤'},
      changedelete = {text = '▎'},
    }
  })