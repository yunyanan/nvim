local packer = require("packer")

packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		---------------------   plugins   ---------------------
		-- nvim-tree
		use({
			"nvim-tree/nvim-tree.lua",
			requires = { 
				"nvim-tree/nvim-web-devicons" 
			},
		})

		-- lualine 状态栏
		use({ 
			"nvim-lualine/lualine.nvim", 
			requires = {
				"kyazdani42/nvim-web-devicons",
				opt = true
			}
		})

		-- bufferline 
		use({
			"akinsho/bufferline.nvim",
			tag = "v3.*",
			dependencies = "nvim-tree/nvim-web-devicons"
		})
		--------------------- colorscheme ---------------------
		-- nord
		use("shaunsingh/nord.nvim")
		use({
			"catppuccin/nvim", 
			as = "catppuccin"
		})
		-------------------------------------------------------
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},

		display = {
			-- 使用浮动窗口显示
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
		augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
		augroup end
	]]
)
