return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- auto_install not really working?
      --auto_install = true,
      ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "clangd" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        -- Server-specific settings. See `:help lspconfig-setup`
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {},
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      vim.diagnostic.config({
        virtual_lines = true,
        --virtual_text = true,      -- Show inline error/warning text
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "true",
        },
      })

      -- auto format on save
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspFormatOnSave", {}),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if
              client
              and not client.supports_method("textDocument/willSaveWaitUntil")
              and client.supports_method("textDocument/formatting")
          then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

      -- Navigate diagnostics and center cursor vertically
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev()
        vim.cmd("normal! zz")
      end, {})
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next()
        vim.cmd("normal! zz")
      end, {})
    end,
  },
}
