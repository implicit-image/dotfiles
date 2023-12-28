local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("local.lsp.mason")
require("local.lsp.handlers").setup()
require("local.lsp.null-ls")
