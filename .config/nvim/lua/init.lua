-- nvim-tree configuration
require'nvim-tree'.setup {}
require'lspconfig'.rls.setup{
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = true,
      full_docs = true,
      all_features = true,
    },
  },
}
require'lspconfig'.tsserver.setup{}
