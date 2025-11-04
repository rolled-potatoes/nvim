return {
      "mason-org/mason.nvim",
      opts = {},
      config = function()
        require("mason").setup {
          automatic_installation = true,
          ensure_installed = {
            'typescript-language-server',
            'stylua',
            'prettier',
            'tailwindcss-laguage-server',
            'css-lsp',
            'bash-language-server',
            'cssmodules-language-server',
            'eslint_d',
            'html-lsp',
            'json-lsp'
          }
        }
      end
}
