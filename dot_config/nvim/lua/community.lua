-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.recipes.vscode" },

  -- NOTE: Coding Languages Support
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.typescript" },

  -- NOTE: ColorSchemes
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  --{ import = "astrocommunity.colorscheme.tokyodark-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },

  -- import/override with your plugins folder
}
