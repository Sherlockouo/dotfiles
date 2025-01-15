return {
  -- themes
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      transparent = true,
      style = "night",
      styles = {
        sidebars = "transparent",
        floats = { "transparent" },
      },
      lualine_bold = true,

      on_colors = function(c)
        c.border_highlight = c.blue

        -- brighten up the git colors, used for gitsigns (column and lualine)
        c.git.add = c.teal
        c.git.change = c.blue
        c.git.delete = c.red1
      end,

      on_highlights = function(hl, c)
        if vim.o.background == "dark" then
          -- Use bg.dark from storm (not night) for the cursor line background to make it more subtle
          hl.CursorLine = { bg = "#1f2335" }

          -- Diff colors
          -- Brighten changes within a line
          hl.DiffText = { bg = "#224e38" }
          -- Make changed lines more green instead of blue
          hl.DiffAdd = { bg = "#182f23" }

          -- More saturated DiffDelete
          hl.DiffDelete = { bg = "#4d1919" }

          -- clean up Neogit diff colors (when committing)
          hl.NeogitDiffAddHighlight = { fg = "#82a957", bg = hl.DiffAdd.bg }

          -- Visual should match visual mode
          hl.TelescopeSelection = hl.Visual
          hl.Visual = { bg = "#3f3256" }

          -- Make TS context dimmer and color line numbers
          hl.TreesitterContext = { bg = "#272d45" }
          hl.TreesitterContextLineNumber = { fg = c.fg_gutter, bg = "#272d45" }
        else
          -- Diff colors
          -- Brighten changes within a line
          hl.DiffText = { bg = "#a3dca9" }
          -- Make changed lines more green instead of blue
          hl.DiffAdd = { bg = "#cce5cf" }

          -- clean up Neogit diff colors (when committing)
          hl.NeogitDiffAddHighlight = { fg = "#4d6534", bg = hl.DiffAdd.bg }

          -- Visual should match visual mode
          hl.TelescopeSelection = hl.Visual
          hl.Visual = { bg = "#b69de2" }

          -- Make TS context color line numbers
          hl.TreesitterContextLineNumber = { fg = "#939aba", bg = "#b3b8d1" }

          -- Make yaml properties and strings more distinct
          hl["@property.yaml"] = { fg = "#006a83" }

          -- Make flash label legible in light mode
          hl.FlashLabel.fg = c.bg
        end

        hl.TelescopeMatching = { fg = hl.IncSearch.bg }
        hl.CmpItemAbbrMatchFuzzy = { fg = hl.IncSearch.bg }
        hl.CmpItemAbbrMatch = { fg = hl.IncSearch.bg }

        -- clean up Neogit diff colors (when committing)
        hl.NeogitDiffContextHighlight = { bg = hl.Normal.bg }
        hl.NeogitDiffContext = { bg = hl.Normal.bg }

        -- Darken cmp menu (src for the completion)
        hl.CmpItemMenu = hl.CmpGhostText

        -- More subtle
        hl.IblScope = hl.LineNr
        -- hl.IblScope = { fg = '#283861' }
        hl.IblIndent = { fg = "#1f202e" }

        -- Make folds less prominent (especially important for DiffView)
        hl.Folded = { fg = c.blue0 }

        -- Make the colors in the Lualine x section dimmer
        local lualine = require("lualine.themes.tokyonight-night")
        lualine.normal.x = { fg = hl.Comment.fg, bg = lualine.normal.c.bg }

        -- Make diagnostic text easier to read (and underlined)
        hl.DiagnosticUnnecessary = hl.DiagnosticUnderlineWarn

        -- Make lsp cursor word highlights dimmer
        hl.LspReferenceWrite = { bg = c.bg_highlight }
        hl.LspReferenceText = { bg = c.bg_highlight }
        hl.LspReferenceRead = { bg = c.bg_highlight }

        hl.TelescopePromptTitle = {
          fg = c.fg,
        }
        hl.TelescopePromptBorder = {
          fg = c.blue1,
        }
        hl.TelescopeResultsTitle = {
          fg = c.purple,
        }
        hl.TelescopePreviewTitle = {
          fg = c.orange,
        }

        hl.HighlightUndo = hl.CurSearch
        hl.HighlightRedo = hl.CurSearch
      end,
    },
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", lazy = false, name = "catppuccin" },
  { "sainnhe/gruvbox-material", name = "gruvbox-material", lazy = false },
  { "dracula/vim", name = "dracula", lazy = false },
  { "rebelot/kanagawa.nvim", name = "kanagawa" },
  { "savq/melange-nvim", name = "melange" },
  { "atmosuwiryo/vim-winteriscoming", name = "winteriscoming" },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    name = "kanagawa",
    opts = {
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    },
  },
}
