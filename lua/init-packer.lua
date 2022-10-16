local packer = require("packer")
-- packer.init({ max_jobs = 1, })
packer.startup({ function(use)

        -- -- Packer can manage itself
        -- use { "wbthomason/packer.nvim" }
        --
        -- -- lsp服务管理
        -- use { "williamboman/mason.nvim" }
        -- use { "williamboman/mason-lspconfig.nvim" }
        --
        -- -- lsp配置
        -- use { "neovim/nvim-lspconfig" }
        --
        -- -- lsp补全
        -- use { "hrsh7th/nvim-cmp" }
        -- use { "hrsh7th/cmp-nvim-lsp" }
        -- use { "hrsh7th/cmp-buffer" }
        -- use { "hrsh7th/cmp-path" }
        -- use { "hrsh7th/cmp-cmdline" }
        --
        -- -- 代码片段
        -- use { "L3MON4D3/LuaSnip" }
        -- use { "saadparwaiz1/cmp_luasnip" }
        -- use { "rafamadriz/friendly-snippets" }
        --
        -- -- UI相关插件
        -- use {
        --         -- 主题
        --         "navarasu/onedark.nvim",
        --         -- 文件树
        --         "kyazdani42/nvim-tree.lua",
        --         -- 状态栏
        --         "nvim-lualine/lualine.nvim",
        --         {
        --                 "akinsho/bufferline.nvim",
        --                 tag = "v2.*",
        --         },
        --         -- icons
        --         { "kyazdani42/nvim-web-devicons", opt = true }
        -- }
        use {
                "nvim-telescope/telescope.nvim", tag = '0.1.x',
                requires = {
                        -- { "nvim-lua/plenary.nvim" },
                        -- { "windwp/nvim-ts-autotag" },
                        -- { "p00f/nvim-ts-rainbow" },
                        -- { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                        -- { "nvim-telescope/telescope-file-browser.nvim" },
                }
        }
        -- use { "ahmedkhalf/project.nvim" }
        -- use { "glepnir/dashboard-nvim" }
        -- use { "lukas-reineke/indent-blankline.nvim" }
        -- use {
        --         "nvim-treesitter/nvim-treesitter",
        --         -- run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        --         run = ':TSUpdate'
        -- }
        -- use {
        --         "lewis6991/gitsigns.nvim",
        --         tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
        -- }
        -- use { "tpope/vim-surround" }
        -- use { "numToStr/Comment.nvim" }
        -- use { "p00f/nvim-ts-rainbow"}
        -- use { "windwp/nvim-autopairs", }
end,
        config = {
                display = {
                        open_fn = function()
                                return require('packer.util').float({ border = 'single' })
                        end
                }
        }
})
