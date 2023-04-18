
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

-- 列表操作快捷键
local list_keys = require('keybinding').nvimTreeList

nvim_tree.setup({
	hijack_cursor = true,		-- 保持光标在文件名第一个字母处
	view = {
		mappings = {
			custom_only = false,
			list = list_keys,
		},
	},
	
	renderer = {
		add_trailing = true,	-- 目录名后面添加 /
		group_empty = true,		-- 将只有一个文件夹的文件夹合并成为一个节点
	},

	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			quit_on_open = true,	-- 打开文件时退出
		}
	},
	
	-- 显示 git 状态图标
	git = {
		enable = true,
	},

	-- project plugin 需要这样设置
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},

	-- wsl install -g wsl-open
	-- https://github.com/4U6U57/wsl-open/
	system_open = {
		cmd = 'wsl-open', -- mac 直接设置为 open
	},

	-- 隐藏 .文件 
	filters = {
		dotfiles = true,
		custom = {  },
	},
})


