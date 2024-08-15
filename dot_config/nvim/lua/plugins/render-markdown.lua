return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        -- NOTE: Prevents double icons
        sign = false,
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
