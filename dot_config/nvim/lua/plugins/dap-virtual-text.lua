return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
  event = "User AstroFile",
  opts = {
    enabled = true,
    commented = false,
    enabled_commands = true,
    show_stop_reason = true,
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,
  },
}
