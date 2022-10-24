local home = os.getenv("HOME")
local OK, db = pcall(require, "dashboard")
if not OK then
	print("找不到 dashboard")
	return
end
-- macos
-- db.preview_command = 'cat | lolcat -F 0.3'
-- linux
-- db.preview_command = 'ueberzug'
--
db.preview_file_path = home .. "/.config/nvim/static/neovim.cat"
db.preview_file_height = 11
db.preview_file_width = 70
db.custom_center = {
	-- { icon = '  ',
	--         desc = 'Recently latest session                  ',
	--         shortcut = 'SPC s l',
	--         action = 'SessionLoad' },
	{
		icon = "  ",
		desc = "History projects                                        ",
		action = "Telescope projects",
		shortcut = "SPC f p",
	},
	{
		icon = "  ",
		desc = "History files                                           ",
		action = "Telescope oldfiles",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Find  File                                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                                            ",
		action = "NvimTreeToggle",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Open vim config                                         ",
		action = "e $MYVIMRC",
		shortcut = "SPC f c",
	},
}
