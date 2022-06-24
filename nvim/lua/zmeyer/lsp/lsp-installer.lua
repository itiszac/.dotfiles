local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
  vim.notify("[lsp-installer]: Error loading nvim-lsp-installer..")
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("zmeyer.lsp.handlers").on_attach,
    capabilities = require("zmeyer.lsp.handlers").capabilities,
  }

  --   if server.name == "bashls" then
  --     local bashls_opts = require("zmeyer.lsp.settings.bashls")
  --     opts = vim.tbl_deep_extend("force", bashls_opts, opts)
  --   end
  if server.name == "gopls" then
    local gopls_opts = require("zmeyer.lsp.settings.gopls")
    opts = vim.tbl_deep_extend("force", gopls_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("zmeyer.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("zmeyer.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("zmeyer.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "tsserver" then
    local tsserver_opts = require("zmeyer.lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  server:setup(opts)
end)
