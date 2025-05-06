local state, nvimtree = pcall(require, "nvim-tree")
if not state then
  return
end

nvimtree.setup({
  sort_by = "case_sensitive",
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  view = {
    centralize_selection = true,
    adaptive_size = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  }
})

local keymap = vim.keymap
keymap.set('n', "<F2>", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle nvim tree" })
keymap.set('n', ',f', ':NvimTreeFindFile<CR>', { desc = "Reveal file in tree" })
