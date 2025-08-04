local state, autopairs = pcall(require, 'nvim-autopairs')

if not state then
  return
end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
