local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip").filetype_extend("javascript", { "html" })
      require("luasnip").filetype_extend("javascriptreact", { "html" })
      require("luasnip").filetype_extend("javascript.jsx", { "html" })
      require("luasnip").filetype_extend("typescript", { "html" })
      require("luasnip").filetype_extend("typescriptreact", { "html" })
      require("luasnip").filetype_extend("typescript.jsx", { "html" })
      require("luasnip").filetype_extend("jsx", { "html" })
      require("luasnip").filetype_extend("php", { "html" })
    end,
  },

  -- Install a plugin

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
