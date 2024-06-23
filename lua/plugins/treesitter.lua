-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "bash",
      "c",
      "cmake",
      "cpp",
      "comment",
      "css",
      "dockerfile",
      "fish",
      "gitignore",
      "go",
      "haskell",
      "html",
      "java",
      "javascript",
      "json",
      "latex",
      "make",
      "python",
      "rust",
      "sql",
      "typescript",
      "yaml",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
