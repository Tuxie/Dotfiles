-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
--
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.color.transparent-nvim" },
  --  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.docker" },

  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.ruby" },

  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.crystal" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.rust" },
}
