local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
-- python
lspconfig.pyright.setup({
  on_attach = on_attach,
  -- on_init = on_init,
  capabilities = capabilities,
  filetypes = {"python"},
})


lspconfig.ruff_lsp.setup {
  on_attach = function(client, bufnr)
    if client.name == 'ruff_lsp' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
    if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({
      group = augroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
    end
  end,
  init_options = {
    settings = {
    -- any extra cli arguments for ruff go here
    args = {},
  },
  },
  commands = {
    RuffAutofix = {
      function()
        vim.lsp.buf.execute_command {
          command = 'ruff.applyAutofix',
          arguments = {
            { uri = vim.uri_from_bufnr(0) },
          },
        }
      end,
      description = 'Ruff: Fix all auto-fixable problems',
    },
    RuffOrganizeImports = {
      function()
        vim.lsp.buf.execute_command {
          command = 'ruff.applyOrganizeImports',
          arguments = {
            { uri = vim.uri_from_bufnr(0) },
          },
        }
      end,
      description = 'Ruff: Format imports',
    },
  },
}
