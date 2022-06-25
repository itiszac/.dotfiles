local colorscheme = "nordfox"
local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
  vim.notify("colorscheme " .. colorscheme .. " not found.. setting to default.")
  return
end
