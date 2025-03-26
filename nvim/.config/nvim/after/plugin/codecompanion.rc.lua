local state, codecompanion = pcall(require, "codecompanion")
if not state then
  return
end
codecompanion.setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "cmd:gpg --decrypt ~/gemini-api-key.gpg 2>/dev/null",
        },
      })
    end,
    opts = {
      allow_insecure = true,
      proxy = "socks5://127.0.0.1:1080",
    },
  },
  strategies = {
    chat = {
      adapter = "gemini",
      keymaps = {
        send = {
          modes = { i = "<C-b>" },
        },
      },
    },
    inline = {
      adapter = "gemini",
    },
  },
})
