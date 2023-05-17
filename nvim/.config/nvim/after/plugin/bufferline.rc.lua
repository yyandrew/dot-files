local state, bufferline = pcall(require, "bufferline")
if not state then
  return
end

bufferline.setup {
  options = {
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold
    },
    numbers = function(opts)
      return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
    end,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
  }
}
