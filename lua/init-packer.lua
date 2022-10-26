local OK, packer = pcall(require, "packer")
if not OK then
	print("没有找到packer-nvim")
	return
end
local use = require("packer").use
packer.startup({
	function()
		-- Packer can manage itself
		use({ "wbthomason/packer.nvim" })

		-- lsp配置相关插件
		-- mason.nvim、mason-lspconfig.nvim、nvim-lspconfig  不能更改这三个插件顺序
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })
		use({ "neovim/nvim-lspconfig" })

		use({ "jose-elias-alvarez/null-ls.nvim" })
		use({ "nvim-lua/plenary.nvim" })

		-- lsp补全相关
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "saadparwaiz1/cmp_luasnip" })
		use({ "L3MON4D3/LuaSnip" })
		use({ "rafamadriz/friendly-snippets" })

		-- 代码操作
		use({ "tpope/vim-surround" })
		-- 注释
		use({ "numToStr/Comment.nvim" })
		-- 括号匹配
		use({ "windwp/nvim-autopairs" })

		-- 操作提示
		use({ "folke/which-key.nvim" })

		-- -- git
		use({
			"lewis6991/gitsigns.nvim",
			-- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
			tag = "release",
		})

		-- -- 终端
		use({ "akinsho/toggleterm.nvim", tag = "*" })

		use({
			"nvim-treesitter/nvim-treesitter",
			-- run = ":TSUpdate",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end,
		})
		-- nvim-treesitter补充
		-- 括号高亮匹配
		use({ "p00f/nvim-ts-rainbow" })
		-- html自动闭合
		use({ "windwp/nvim-ts-autotag" })

		-- 搜索相关
		use({
			-- or, branch = '0.1.x',
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
		})
		-- telescope.nvim补充
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

		use({ "ahmedkhalf/project.nvim" })

		-- UI相关
		use({ "glepnir/dashboard-nvim" })
		use("navarasu/onedark.nvim")
		use({ "nvim-tree/nvim-tree.lua", tag = "nightly" })
		use({ "nvim-lualine/lualine.nvim" })
		use({ "akinsho/bufferline.nvim", tag = "v3.*" })
		-- icon
		use({ "nvim-tree/nvim-web-devicons" })
		-- use({ "lukas-reineke/indent-blankline.nvim" })
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
