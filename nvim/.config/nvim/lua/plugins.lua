return {
  'terryma/vim-multiple-cursors',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  -- colorscheme
  'joshdick/onedark.vim',
  'morhetz/gruvbox',
  'drewtempelmeyer/palenight.vim',
  'dracula/vim',
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  'haishanh/night-owl.vim',
  -- 'Yggdroot/indentLine',
  'scrooloose/nerdcommenter',
  'nvim-lualine/lualine.nvim',
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', build = ":TSUpdate" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    }
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-vsnip',
  'SirVer/ultisnips',
  'honza/vim-snippets',
  'quangnguyen30192/cmp-nvim-ultisnips',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  "glepnir/lspsaga.nvim",
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'mfussenegger/nvim-dap',
  {
    'smoka7/hop.nvim',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  'tpope/vim-rails',
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  'tpope/vim-bundler',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  -- 'ngmy/vim-rubocop',
  'mattn/emmet-vim',
  'editorconfig/editorconfig-vim',
  'airblade/vim-gitgutter',
  'rhysd/git-messenger.vim',
  'f-person/git-blame.nvim',
  'tpope/vim-repeat',
  'mxw/vim-jsx',
  -- 'github/copilot.vim',
  'junegunn/vim-peekaboo',
  'tpope/vim-abolish',
  { 'kkoomen/vim-doge',              build = ":call doge#install()" },
  'tpope/vim-sleuth',
  'preservim/vimux',
  'vim-test/vim-test',
  -- { 'Exafunction/codeium.vim', event = 'BufEnter' },
  'tpope/vim-speeddating',
  {
    "rareitems/anki.nvim",
    -- lazy -- don't lazy it, it tries to be as lazy possible and it needs to add a filetype association
    opts = {
      {
        -- this function will add support for associating '.anki' extension with both 'anki' and 'tex' filetype.
        tex_support = false,
        models = {
          -- Here you specify which notetype should be associated with which deck
          ["Basic"] = "my_test",
        },
      }
    }
  },
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = { "markdown", "codecompanion" },
  },
  { "folke/neodev.nvim",       opts = {} },
}
