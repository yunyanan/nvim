vim.g.mapleader = " "			-- leader key 设置为空格
vim.g.maplocalleader = " "		-- 本地 leader key


--[[
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
	- mode 模式
		+ n: 普通模式
		+ n：普通模式
		+ v：可视模式
		+ i：插入模式
		+ o：操作符等待模式
		+ x：可视模式（仅限于行）
		+ s：选择模式
		+ c：命令行模式
		+ t：终端模式
	- lhs 表示按键按下时给出的按键序列。例如，'<leader>w' 表示在普通模式下按下 Leader 键和 w 键
	- rhs 表示要执行的 Ex 命令。例如，:w<CR> 表示输入字符 :w 并按回车键。
	- opts 表示映射选项。它是一个包含了若干键值对的 Lua 表格
		+ noremap(默认为 false)  禁用递归映射
		+ nowait (默认为 false)  不等待按键序列的其余部分
		+ silent (默认为 false)  不显示命令响应
		+ expr   (默认为 false)  则视 rhs 参数为一个表达式，并将其执行的结果作为替换文本
		+ script (默认为 false)  则定义的是一个 Lua 脚本，而不是 Ex 命令
		+ buffer (默认为 0)      绑定映射到指定的缓冲区
		+ unique (默认为 false)  指定映射是否唯一
		
	eg:
		vim.api.nvim_set_var('mapleader', ' ')
		vim.api.nvim_set_keymap('n', '<leader>a', ':w<CR>', {noremap = true})
		首先，vim.api.nvim_set_var('mapleader', ' ') 命令将空格键设置为 Leader 键。接下来，vim.api.nvim_set_keymap() 命令将 <leader>a 映射到 Ex 命令 :w<CR> ，并显式禁用了递归映射选项。
]]


local map = vim.api.nvim_set_keymap				-- 重定义设置快捷键函数的函数名
local opt = {noremap = true, silent = true }	-- 重定义 nvim_set_keymap 函数  opts 参数


-- 取消 s 默认功能(normal 模式下剪切光标下的字符并进入插入模式)
map("n", "s", "", opt)

-- 分屏操作
map("n", "sv", ":vsp<CR>", opt)		-- 向右分屏
map("n", "sh", ":sp<CR>", opt)		-- 向下分屏
map("n", "sc", "<C-w>c", opt)		-- 关闭当前窗口
map("n", "so", "<C-w>o", opt)		-- 关闭其他窗口

-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)	-- 向左切换窗口
map("n", "<A-j>", "<C-w>j", opt)	-- 向下切换窗口
map("n", "<A-k>", "<C-w>k", opt)	-- 向上切换窗口
map("n", "<A-l>", "<C-w>l", opt)	-- 向右切换窗口

-- 上下左右窗口比例控制
map("n", "<C-Down>", ":resize +2<CR>", opt)				-- 水平方向调整 2 行
map("n", "<C-Up>",   ":resize -2<CR>", opt)				-- 水平方向调整 2 行
map("n", "<C-Left>",  ":vertical resize -2<CR>", opt)	-- 垂直方向调整 2 行
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)	-- 垂直方向调整 2 行
map("n", "C-=", "<C-w>=", opt)							-- 各窗口恢复原始比例

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)		-- 向下移动 4 行
map("n", "<C-k>", "4k", opt)		-- 向上移动 4 行
map("n", "<C-n>", "9j", opt)		-- 向下移动 9 行
map("n", "<C-p>", "9k", opt)		-- 向上移动 9 行

-- 退出
map("n", "q", ":q<CR>", opt)		-- 退出
map("n", "qq", ":wq<CR>", opt)		-- 保存退出
map("n", "qqq", ":q!<CR>", opt)		-- 强制退出
map("n", "Q", ":qa!<CR>", opt)		-- 强制保存退出

-- 保存
map("n", "<C-s>", ":w<CR>", opt)	-- 保存

-- Terminal
map("n", "<leader>t", ":sp | terminal<CR>", opt)		-- 在新的水平分屏中打开 Vim 终端窗口
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)		-- 在新的垂直分屏中打开 Vim 终端窗口
map("t", "<Esc>", "<C-\\><C-n>", opt)					-- 退出终端模式

map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)			-- 终端模式下向左切换窗口
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)			-- 终端模式下向下切换窗口
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)			-- 终端模式下向上切换窗口
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)			-- 终端模式下向右切换窗口


-- visual模式下
map("v", "<", "<gv", opt)		-- 向左缩进选中代码
map("v", ">", ">gv", opt)		-- 向右缩进选中代码
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)	-- 向下移动选中代码
map("v", "K", ":move '<-2<CR>gv-gv", opt)	-- 向上移动选中代码

-- 在visual 模式里粘贴不要复制
-- map("v", "p", '"_dP', opt)


-- insert 模式
map("i", "<C-a>", "<ESC>I", opt)	-- 跳转行头
map("i", "<C-e>", "<ESC>A", opt)	-- 跳转行尾
map("i", "<C-s>", "<ESC>:w<CR>i", opt)	-- 保存


-- 插件快捷键
local pluginKeys = {}


-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<leader>f", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹	
	{ key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}


return pluginKeys

