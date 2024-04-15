local state, devicons = pcall(require, "nvim-web-devicons")
if not state then
  return
end

devicons.setup {
  override = {};
  default = true;
}
devicons.set_icon {
  ['proto'] = {
    icon = "󰈧",
    color = "#cb4a32",
    cterm_color = "160",
    name = "proto",
  }
}
