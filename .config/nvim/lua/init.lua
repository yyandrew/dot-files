-- nvim-tree configuration
require'nvim-tree'.setup {}
local nvim_lsp = require('lspconfig')
nvim_lsp.rls.setup{
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = true,
      full_docs = true,
      all_features = true,
    },
  },
}
nvim_lsp.tsserver.setup{
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}
nvim_lsp.solargraph.setup{}
require('keymappings')
