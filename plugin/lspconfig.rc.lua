local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
end

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
   init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if vim.fn.executable("cssmodules-language-server") == 1 then
  nvim_lsp.cssmodules_ls.setup{
    cmd = { "cssmodules-language-server" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  }
end

if vim.fn.executable("vscode-css-language-server") == 1 then
  nvim_lsp.cssls.setup {
    on_attach = on_attach,
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    capabilities = capabilities,
  }
end

if vim.fn.executable('lua-language-server') == 1 then
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
end


if vim.fn.executable('docker-compose-langserver') == 1 then
  nvim_lsp.docker_compose_language_service.setup{}
end

if vim.fn.executable('tailwindcss-language-server') ==1 then
  nvim_lsp.tailwindcss.setup{
   filetypes = { "javascriptreact", "typescriptreact"},
  }
end

vim.diagnostic.config({
  virtual_text = false,
})

vim.keymap.set('n', '<C-g>f', '<Cmd>:lua vim.diagnostic.open_float()<CR>', {})
