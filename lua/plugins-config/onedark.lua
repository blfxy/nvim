local OK, onedark = pcall(require, "onedark")
if not OK then
        print("not found onedark")
        return
end
-- Lua
onedark.setup {
    -- style = 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    style = 'deep'
}
require('onedark').load()
