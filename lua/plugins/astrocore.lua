-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        colorcolumn = "80", -- sets vim.opt.colorcolumn to 80
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        instant_username = "Kieranoski", -- set the username for instant neovim plugin
        vimtex_view_method = "zathura", -- set the pdf viewer for vimtex
        vimtex_syntax_enabled = 1, -- enable syntax highlighting in vimtex
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
        -- Create floating window for error diagnostic
        ["<leader>m"] = {
          function() vim.diagnostic.open_float() end,
          desc = "Open diagnostic float window",
        },
        ["<leader>z"] = { name = "Custom" },
        ["<leader>zu"] = {
          function() vim.cmd.UndotreeToggle() end,
          desc = "Toggle undo tree",
        },
        ["<leader>zz"] = {
          function() require("zen-mode").toggle() end,
          desc = "Toggle zen mode",
        },
        ["<leader>zc"] = {
          function() require("chatgpt").openChat() end,
          desc = "Open ChatGPT window",
        },
        ["<leader>zs"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace" },

        -- add overwrite mapping for vim-tmux-navigator
        ["<C-h>"] = { ":TmuxNavigateLeft<CR>", desc = "window left" },
        ["<C-l>"] = { ":TmuxNavigateRight<CR>", desc = "window right" },
        ["<C-k>"] = { ":TmuxNavigateUp<CR>", desc = "window up" },
        ["<C-j>"] = { ":TmuxNavigateUp<CR>", desc = "window down" },
      },
      v = {
        ["<leader>e"] = {
          function() require("chatgpt").edit_with_instructions() end,
          desc = "Edit with instructions",
        },
        -- Take visual selection and replace all occurrences in the file. First yank
        -- to useless register, the use it in the search and replace command.
        ["<leader>s"] = {
          function()
            -- Yank the visual selection to register "z"
            vim.api.nvim_command 'normal! "zy'

            -- Open the command line and add it to search and replace command then allow
            -- user to edit it.
            vim.fn.feedkeys ":%s/"
            vim.fn.feedkeys(vim.fn.getreg "z") -- Paste the content of register "z"
            vim.fn.feedkeys "/"
            vim.fn.feedkeys(vim.fn.getreg "z") -- Paste the content of register "z"
            vim.fn.feedkeys "/gI"
            -- Move the cursor to the left to allow user to edit the command.
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left><Left><Left>", true, true, true), "n", true)
          end,
          desc = "Search and replace",
        },
      },
    },
  },
}
