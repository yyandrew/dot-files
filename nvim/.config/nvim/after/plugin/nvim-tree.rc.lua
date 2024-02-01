local state, nvimtree = pcall(require, "nvim-tree")
if not state then
  return
end

nvimtree.setup({
  sort_by = "case_sensitive",
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})

local keymap = vim.keymap
keymap.set('n', "<F2>", ":NvimTreeToggle<CR>", { desc = "Toggle nvim tree" })
keymap.set('n', ',f', ':NvimTreeFindFile<CR>', { desc = "Reveal file in tree" })
