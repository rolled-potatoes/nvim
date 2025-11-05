local a = 123;

-- lua/plugins/lsp.lua
return {
  -- 1. LSP 핵심 설정 (lspconfig)
  {
    'neovim/nvim-lspconfig',
    -- 플러그인이 로드될 때 실행할 설정 함수
    config = function()
      -- === 필수 모듈 로드 ===
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      -- === 3. Mason 설정 (언어 서버 설치) ===
      -- Node.js 풀스택 개발을 위한 기본 언어 서버 목록
      local servers = {
        "ts_ls",   -- TypeScript/JavaScript
        "eslint",     -- ESLint (Linter)
        "jsonls",     -- JSON
        "cssls",      -- CSS
        "html",       -- HTML
        "dockerls",   -- Dockerfile
        "marksman",   -- Markdown
        "bashls",     -- Shell 스크립트
        "tailwindcss", 
        "stylua"
      }

      require('mason').setup()
      mason_lspconfig.setup({
        ensure_installed = servers, -- 이 서버들이 자동으로 설치되도록 보장
        automatic_installation = true, -- 서버가 없을 경우 자동 설치
        automatic_enable = true
      })
    end,

    -- === 의존성 플러그인 목록 ===
    dependencies = {
      -- 언어 서버 자동 설치 및 관리
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
  },
}
