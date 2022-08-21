local status, prettier = pcall(require, 'prettier')

if (not status) then return end

prettier.setup {
  bin = 'prettier',
  filetypes = {
    "css",
    "scss",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "markdown",
    "yaml",
  }
}
