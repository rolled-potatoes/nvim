local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.cssls.setup{
  on_attach = on_attach,
  cmd={ "vscode-css-language-server", "--stdio" },
  filetypes  = { "css", "scss", "less" },
  capabilities = capabilities,
}

nvim_lsp.cssmodules_ls.setup{
  cmd = { "cssmodules-language-server" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true)
    }
  }
}
