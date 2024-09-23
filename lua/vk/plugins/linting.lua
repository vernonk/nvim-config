return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    local eslint_d = require("lint").linters.eslint_d
    eslint_d.args = {
      '--stdin',
      '--stdin-filename',
      '%filepath',
    }

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    -- Run lint
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Run eslint_d --fix on save to autofix issues
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
      callback = function()
        vim.cmd([[
          silent! !eslint_d --fix % 
          edit! 
        ]])
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
