return {
  'terryma/vim-multiple-cursors',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  { 'junegunn/fzf',                  build = './install --bin', },
  'junegunn/fzf.vim',
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
  'Yggdroot/indentLine',
  'scrooloose/nerdcommenter',
  'nvim-lualine/lualine.nvim',
  'Eandrju/cellular-automaton.nvim',
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope.nvim', build = ":TSUpdate" },
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
  'shime/vim-livedown',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'mfussenegger/nvim-dap',
  {
    'phaazon/hop.nvim',
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
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-bundler',
  'jiangmiao/auto-pairs',
  'ngmy/vim-rubocop',
  'mattn/emmet-vim',
  'editorconfig/editorconfig-vim',
  'airblade/vim-gitgutter',
  'rhysd/git-messenger.vim',
  'tpope/vim-repeat',
  'mxw/vim-jsx',
  'tpope/vim-endwise',
  'danchoi/ri.vim',
  'kana/vim-textobj-user',
  'wlemuel/vim-tldr',
  -- 'github/copilot.vim',
  'shumphrey/fugitive-gitlab.vim',
  -- dadbod
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',

  'junegunn/vim-peekaboo',
  'tpope/vim-abolish',
  {'kkoomen/vim-doge' , build = ":call doge#install()"},
  { 'prettier/vim-prettier', build = 'yarn install --frozen-lockfile --production' },
  'tpope/vim-sleuth',
  'preservim/vimux',
  'vim-test/vim-test',
  'akinsho/bufferline.nvim',
  'Exafunction/codeium.vim', event = 'BufEnter'
}
