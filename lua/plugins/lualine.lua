
-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

lualine.setup({
	options = {
		theme = "nord",  -- 主题
		-- theme = "ayu_light",
		-- theme = "powerline",
		component_separators = {	-- 不同部分之间的分隔符号 
			left = "󰂶",
			right ="󰂵"
		}, 
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = {		-- 各部分之间的分隔符号
			left = " ", 
			right = "" 
		},
	},

	extensions = {			-- 扩展 
		"nvim-tree", 
		"toggleterm" 
	},
	
	sections = {
--[[
		lualine_a = {		-- 主模式区域，显示当前模式
			"mode"
		},
		lualine_b = {		-- 当前文件区域
			"branch",
			"filename",
			"filetype"
		},
]]--
		lualine_c = {		-- 左侧选项配置
			"filename",
			{
				"lsp_progress",
				spinner_symbols = { " ", " ", " ", " ", " ", " " },
			},
		},
		lualine_x = {		-- 右侧选项配置
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = '', -- e712
					dos = '', -- e70f
					mac = '', -- e711
				},
				--symbols = {
				--unix = "LF",
				--dos = "CRLF",
				--mac = "CR",
				--},
			},
			"encoding",
			"filetype",
		},
--[[
		lualine_y = {		-- 仅在分离符左侧的右侧区域中。通常包含 "添加/保存/撤销" 的状态和家在时间等信息
		},
		lualine_z = {		-- 末尾区域，在该区域通常包含行号，列号，编辑器相对大小和文档大小百分比信息
		},
]]--
	},
})
