-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      italic = {
        strings = false,
        comments = false,
      },
    },
  },
  { "mbbill/undotree", lazy = false },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "tpope/vim-obsession" },
  { "jbyuki/instant.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "ShinKage/idris2-nvim" },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup {
  --       popup_input = {
  --         submit = "<C-s>",
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  {
    "quarto-dev/quarto-nvim",
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "html", "lua" },
      },
    },
    ft = "quarto",
    keys = {
      { "<localleader>qa", ":QuartoActivate<cr>", desc = "quarto activate" },
      { "<localleader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "quarto preview" },
      { "<localleader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
      { "<localleader>qh", ":QuartoHelp ", desc = "quarto help" },
      { "<localleader>qe", ":lua require'otter'.export()<cr>", desc = "quarto export" },
      { "<localleader>qE", ":lua require'otter'.export(true)<cr>", desc = "quarto export overwrite" },
      { "<localleader>qrr", ":QuartoSendAbove<cr>", desc = "quarto run to cursor" },
      { "<localleader>qra", ":QuartoSendAll<cr>", desc = "quarto run all" },
      { "<localleader><cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      { "<c-cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      {
        "<c-cr>",
        "<esc>:SlimeSend<cr>i",
        mode = "i",
        desc = "send code chunk",
      },
      {
        "<c-cr>",
        "<Plug>SlimeRegionSend<cr>",
        mode = "v",
        desc = "send code chunk",
      },
      {
        "<cr>",
        "<Plug>SlimeRegionSend<cr>",
        mode = "v",
        desc = "send code chunk",
      },
      { "<localleader>ctr", ":split term://R<cr>", desc = "terminal: R" },
      { "<localleader>cti", ":split term://ipython<cr>", desc = "terminal: ipython" },
      { "<localleader>ctp", ":split term://python<cr>", desc = "terminal: python" },
      { "<localleader>ctj", ":split term://julia<cr>", desc = "terminal: julia" },
    },
  },
  { "jmbuhr/otter.nvim" },
  {
    "tpope/vim-fugitive",
    opt = true,
    cmd = {
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
  },
  {
    "lambdalisue/suda.vim",
    cmd = {
      "SudaRead",
      "SudaWrite",
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "sickill/vim-pasta",
    config = function() vim.g["pasta_enabled_filetypes"] = { "python" } end,
  },
  {
    "EtiamNullam/deferred-clipboard.nvim",
    config = function() require("deferred-clipboard").setup {} end,
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    version = "*",
    config = true,
  },
  { "nicholasmata/nvim-dap-cs", dependencies = { "mfussenegger/nvim-dap" } },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {
      -- add any opts here
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
