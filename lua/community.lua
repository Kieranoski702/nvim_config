-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.media.presence-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.marks-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  -- { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.cmake" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.python-ruff" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.toml" },
  -- { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.media.vim-wakatime" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  -- { import = "astrocommunity.pack.terraform" },
  -- { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.markdown-and-latex.vimtex" },
  -- import/override with your plugins folder
}
