return {
  "folke/todo-comments.nvim",
  opts = function(plugin, opts)
    return {
      signs = true,

      keywords = {
        -- FIX:
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        -- TODO:
        TODO = { icon = " ", color = "info" },
        -- HACK:
        HACK = { icon = " ", color = "default" },
        -- WARN:
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        -- PERF:
        PERF = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        -- NOTE:
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        -- TEST:
        TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },

      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
    }
  end,
}
