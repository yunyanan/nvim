
local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("没有找到 bufferline")
  return
end

-- bufferline 配置
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
	options = {
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		offsets = {
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left",
		},	
	},
})

