local state, devicons = pcall(require, "nvim-web-devicons")
if not state then
  return
end

devicons.setup {
  override = {},
  default = true
}
