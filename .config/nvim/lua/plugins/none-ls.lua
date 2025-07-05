return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local eslint_d = require("none-ls.diagnostics.eslint_d")
    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.biome.with({
        condition = function(utils)
          return utils.root_has_file({ "biome.json" })
        end,
      }),
      eslint_d.with({
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc", "eslint.config.js" })
        end,
      }),
    }

    null_ls.setup({
      sources = sources,
    })

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
  end,
}
