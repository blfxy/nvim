local Ok, bufferline = pcall(require, "bufferline")
if not Ok then
        vim.notify("没有找到 bufferline")
        return
end
bufferline.setup({
        options = {
                mode = 'buffer',
                offsets = {
                        { filetype = 'NvimTree' }
                }
        },
        highlights = {
                buffer_selected = {
                        italic = false
                },
                indicator_selected = {
                        fg = { attribute = 'fg', highlight = 'Function' },
                        italic = false
                }
        }
})

local opt = {
        noremap = true,
        silent = true,
}
local map = vim.api.nvim_set_keymap
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<C-w>", ":Bdelete!<CR>", opt)