local state, nvimtree = pcall(require, "nvim-tree")
if not state then
  return
end

nvimtree.setup {
  sort_by = "case_sensitive",
  filters = {
    dotfiles = true,
  },
}
