local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("[treesitter]: Error loading nvim-treesitter.configs")
  return
end

configs.setup({
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- list of parsers to ignore
  highlight = {
    enable = true, -- false will disable entire extension
    disable = { "" }, -- list of languages that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
})
