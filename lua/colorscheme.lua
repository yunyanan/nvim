
-- catppuccin
require("catppuccin").setup({
	flavour = "latte",
	-- flavour = "frappe",
	background = {
		light = "latte",
		dark = "frappe",
	},
})


-- local colorscheme = "nord"
local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
	return
end


