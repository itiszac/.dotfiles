local status, _ = pcall(require, "lspconfig")
if not status then
  vim.notify("[lsp]: could not load lspconfig..")
  return
end

require("zmeyer.lsp.lsp-installer")
require("zmeyer.lsp.handlers").setup()
