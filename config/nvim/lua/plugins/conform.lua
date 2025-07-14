return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Disable formatting for zsh
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      zsh = {}, -- no formatters for zsh
    })

    -- Explicitly disable the formatters globally
    opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
      shfmt = { condition = function(_) return false end },
      shellcheck = { condition = function(_) return false end },
    })
  end,
}
