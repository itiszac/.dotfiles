return {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod", "gotmpl" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
