-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- jkhl 移动时离屏幕边缘保持8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- 使用相对行号
vim.wo.number = true		-- 开启行号 (开启相对行号时， true - 当前行显示实际行号； false - 当前行显示 0)
vim.wo.relativenumber = true	-- 相对行号

-- 高亮所在行
vim.wo.cursorline = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"

-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"

-- 缩进
vim.o.tabstop = 4		-- tab 占用 4 个空格 (tabstop 只修改 tab 字符的显示宽度，不修改 Tab 键的行为)
vim.bo.tabstop = 4		-- 同上，针对当前缓冲区
vim.o.softtabstop = 4		-- Tab 占用 4 个空格 (softtabstop 只修改 Tab 键的行为，不修改 tab 字符的显示宽度)

-- >> << 时移动长度
vim.o.shiftround = true		-- 使用 >> 或 << 命令缩进时，会缩进 shiftwidth 个空格或 tab
vim.o.shiftwidth = 4		-- 自动缩进时长度为 4
vim.bo.shiftwidth = 4		-- 同上

-- 空格替代tab
-- vim.o.expandtab = true
-- vim.bo.expandtab = true

-- 新行对齐当前行
vim.o.autoindent = true		-- 插入新行时将新行缩进到上一行的缩进级别
vim.bo.autoindent = true	-- 同上，针对当前缓冲区
vim.o.smartindent = true	-- 智能缩进

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = false

-- 边输入边搜索
vim.o.incsearch = true

-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2

-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止折行
vim.wo.wrap = false

-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'

-- 允许隐藏被修改过的buffer
vim.o.hidden = true

-- 鼠标支持
vim.o.mouse = "a"

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime,用于控制 Vim 在插入模式下，检查更改之间的间隔时间,有助于减少不必要的刷新和提高性能.
vim.o.updatetime = 300

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒
vim.o.timeoutlen = 500

-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 样式
vim.o.background = "dark"	-- 修改背景 （dark/light）
vim.o.termguicolors = true	-- 启用真彩色支持，需要终端支持真彩色
vim.opt.termguicolors = true	-- 启用终端真彩色

-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·,tab:> "

-- 补全增强
vim.o.wildmenu = true		-- 启用高级命令自动补全

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'	-- 这个命令将 c 标志添加到 shortmess 中，c 选项表示在执行命令时不清空屏幕。

-- 设置弹出式菜单高度(补全条目数量)
vim.o.pumheight = 10

-- 永远显示 tabline
vim.o.showtabline = 2

-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false

-- nvim-tree 建议
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true




